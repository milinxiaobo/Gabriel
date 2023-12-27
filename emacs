Welcome to GNU Emacs, a part of the GNU operating system.

Get help           C-h  (Hold down CTRL and press h)
Emacs manual       C-h r        Browse manuals     C-h i
Emacs tutorial     C-h t        Undo changes       C-x u
Buy manuals        C-h RET      Exit Emacs         C-x C-c
Activate menubar   M-`
(‘C-’ means use the CTRL key.  ‘M-’ means use the Meta (or Alt) key.
If you have no Meta key, you may instead type ESC followed by the character.)
Useful tasks:
Visit New File                  Open Home Directory
Customize Startup               Open *scratch* buffer

GNU Emacs 28.2 (build 1, aarch64-apple-darwin21.1.0, NS appkit-2113.00 Version \
12.0.1 (Build 21A559))
 of 2023-02-23
Copyright (C) 2022 Free Software Foundation, Inc.

GNU Emacs comes with ABSOLUTELY NO WARRANTY; type C-h C-w for full details.
Emacs is Free Software--Free as in Freedom--so you can redistribute copies
of Emacs and modify it; type C-h C-c to see the conditions.
Type C-h C-o for information on getting the latest version.



;; (add-to-list 'exec-path "/opt/nils/miniconda3/envs/nils/bin")
;; (add-to-list 'exec-path "/opt/nils/cmake-3.26.4-macos-universal/CMake.app/Contents/bin")
;; (add-to-list 'exec-path "/opt/nils")

;;
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line

;; (load-theme 'tango-plus t)
;; (load-theme 'dracula t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'solarized-light t)

(setq auto-save-default nil)
(setq make-backup-files nil)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(global-disable-mouse-mode)

;; (set-frame-font "Fira Code 18" nil t)
;; (set-frame-font "Source Code Pro 18" nil t)
;; (set-frame-font "Courier New 18" nil t)
;; (set-frame-font "consolas 18" nil t)
;; (set-frame-font "Menlo 18" nil t)
(set-frame-font "Menlo 18" nil t)

;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq org-support-shift-select 'always)

;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(solarized-theme cuda-mode disable-mouse)))
;;

;; (put 'upcase-region 'disabled nil)
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((((class color) (min-colors 89)) (:foreground "#839496" :background "#002b36")))))
;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
