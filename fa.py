作者：小冬瓜AIGC
链接：https://zhuanlan.zhihu.com/p/670085985
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

# author: 小冬瓜AIGC

import torch
from einops import rearrange

Q_BLOCK_SIZE = 3
KV_BLOCK_SIZE = 3
NEG_INF = -1e10  # -infinity
EPSILON = 1e-10
Q_LEN = 6
K_LEN = 6
Tr = Q_LEN // Q_BLOCK_SIZE
Tc = K_LEN // KV_BLOCK_SIZE

Q = torch.randn(1, 1, 6, 4, requires_grad=True).to(device='cpu')
K = torch.randn(1, 1, 6, 4, requires_grad=True).to(device='cpu')
V = torch.randn(1, 1, 6, 4, requires_grad=True).to(device='cpu')
O = torch.zeros_like(Q, requires_grad=True)
l = torch.zeros(Q.shape[:-1])[..., None]
m = torch.ones(Q.shape[:-1])[..., None] * NEG_INF

Q_BLOCKS = torch.split(Q, Q_BLOCK_SIZE, dim=2)
K_BLOCKS = torch.split(K, KV_BLOCK_SIZE, dim=2)
V_BLOCKS = torch.split(V, KV_BLOCK_SIZE, dim=2)
O_BLOCKS = list(torch.split(O, Q_BLOCK_SIZE, dim=2))
l_BLOCKS = list(torch.split(l, Q_BLOCK_SIZE, dim=2))
m_BLOCKS = list(torch.split(m, Q_BLOCK_SIZE, dim=2))

# start with Q
for i in range(Tr):
    Qi = Q_BLOCKS[i]
    Oi = O_BLOCKS[i]
    li = l_BLOCKS[i]
    mi = m_BLOCKS[i]
    
    for j in range(Tc):
        #if j>i: 
        #    continue    # ignore masked      
        Kj = K_BLOCKS[j]
        Vj = V_BLOCKS[j]

        S_ij = Qi @ Kj.transpose(2,3)
        m_block_ij, _ = torch.max(S_ij, dim=-1, keepdims=True)
        mi_new = torch.maximum(m_block_ij, mi)
        P_ij_hat = torch.exp(S_ij - mi_new)
        l_block_ij = torch.sum(P_ij_hat, dim=-1, keepdims=True) + EPSILON
        li_new = torch.exp(mi - mi_new) * li  + l_block_ij 
        O_i = torch.exp(mi - mi_new) * Oi + P_ij_hat @ Vj
          
        print(f'-----------O{i} = attn( Q{i}, KV[{j}])---------')
        print(O_i)
        
    O_BLOCKS[i] = O_i / li_new # 最后做Scaled
    l_BLOCKS[i] = li_new
    m_BLOCKS[i] = mi_new
    
O = torch.cat(O_BLOCKS, dim=2)
l = torch.cat(l_BLOCKS, dim=2)
m = torch.cat(m_BLOCKS, dim=2)
