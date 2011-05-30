;;显示行号标记，行号上限1000000
;(global-linum-mode 1)
;(setq line-number-display-limit 1000000)
;;所在行号列号
(column-number-mode t)
;;语法高亮
(global-font-lock-mode t)
;;时间显示
(display-time)
;;关闭启动时的界面
(setq inhibit-startup-message t)
;;menu tool scroll
;(menu-bar-mode -1)
(tool-bar-mode -1)
;(scroll-bar-mode -1)
;;光标不闪
(blink-cursor-mode -1)
;;不要生成临时文件
(setq make-backup-files nil)
;;显示括号匹配
(show-paren-mode t)
;;不要鼠标点到地方都加到剪切板里
(setq mouse-yank-at-point t)
;;缓存值
(setq kill-ring-max 200)
;;行填充量
(setq default-fill-column 60)
;;可以递归使用minibuffer
(setq enable-recursive-minibuffers t)
;;默认打开路径
(setq default-directory "~/")
;;记录最后修改文件的时间
(add-hook 'write-file-hooks 'time-stamp)
(setq time-stamp-format "by %:u %02m/%02d/%04y %02H:%02M:%02S")
;;打开图片文件
(auto-image-file-mode t)
;; 在行首 C-k 时，同时删除该行。
(setq-default kill-whole-line t)
;;在文档最后自动插入空白一行
(setq require-final-newline t)
(setq track-eol t)
;;靠近屏幕边沿2行开始滚动
(setq scroll-margin 2
      scroll-conservatively 10000)
;;title format.
(setq frame-title-format
      '((:eval (if (buffer-file-name)
		   (file-truename (buffer-file-name))
		   (buffer-name)))))
(setq initial-scratch-message
      "Don't loose yourself.")
;;prefix 多行
(setq adaptive-fill-regexp "[ \t]+\\|[ \t]*\\([0-9]+\\.\\|\\*+\\)[ \t]*")
;;prefix单行
(setq adaptive-fill-first-line-regexp "^\\* *$")
;;M-spc标记
(global-set-key (kbd "M-<SPC>") 'set-mark-command)
;;个人信息
(setq user-full-name "lumpy")
(setq user-mail-address "wzlxx.c@gmail.com")
;; 在退出 emacs 之前确认是否退出
;(setq confirm-kill-emacs 'yes-or-no-p)
;;y/n代替yes/no
(fset 'yes-or-no-p 'y-or-n-p)


(provide 'basic)
