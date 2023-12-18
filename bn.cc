Batch Normalization (BatchNorm) 是一种深度学习中的常用技术，它可以加速模型的训练并提高模型的稳定性。在 C++ 中实现 BatchNorm，不使用 Eigen 库是可能的，但可能会相对复杂一些。
下面是一个简单的示例，展示如何在 C++ 中手动实现 BatchNorm：
```cpp
#include <iostream>
#include <vector>
// 假设输入数据为一维向量
void batchNormalization(const std::vector<float>& input, const int batchSize, const int featureSize, std::vector<float>& output) {
    // 计算均值和方差
    float sum = 0.0;
    float sumOfSquares = 0.0;
    for (int i = 0; i < batchSize; i++) {
        for (int j = 0; j < featureSize; j++) {
            sum += input[i * featureSize + j];
            sumOfSquares += input[i * featureSize + j] * input[i * featureSize + j];
        }
    }
    float mean = sum / (batchSize * featureSize);
    float variance = sumOfSquares / (batchSize * featureSize) - mean * mean;
    // 标准化输入数据
    for (int i = 0; i < batchSize; i++) {
        for (int j = 0; j < featureSize; j++) {
            output[i * featureSize + j] = (input[i * featureSize + j] - mean) / sqrt(variance);
        }
    }
}
int main() {
    // 示例输入数据，假设有 3 个样本，每个样本有 4 个特征
    std::vector<float> input = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0};
    int batchSize = 3;
    int featureSize = 4;
    // 输出数据用于存储标准化后的结果
    std::vector<float> output(batchSize * featureSize);
    // 进行批量标准化
    batchNormalization(input, batchSize, featureSize, output);
    // 输出标准化后的结果
    for (int i = 0; i < batchSize * featureSize; i++) {
        std::cout << output[i] << " ";
    }
    std::cout << std::endl;
    return 0;
}
```
上述代码中，`batchNormalization` 函数实现了 BatchNorm 的核心计算过程。它首先计算输入数据的均值和方差，然后对输入数据进行标准化。最后，将标准化后的结果存储在输出数据中。
需要注意的是，这个示例只是展示了如何在 C++ 中手动实现 BatchNorm 的基本概念。在实际应用中，深度学习框架（如 TensorFlow、PyTorch 等）通常提供了更高效和稳定的实现。如果需要在实际项目中使用 BatchNorm，建议使用这些框架提供的 API。
