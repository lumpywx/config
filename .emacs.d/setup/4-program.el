;;--------------------functions--------------------
;;arm中的寄存器宏补全
(defun lumpy-arm-trans-region ()
  (interactive)
  (when mark-active
    (let* ((b (region-beginning))
	   (e (region-end))
	   (lines (split-string (buffer-substring-no-properties b e) "\n")))
      (delete-region b e)
      (dolist (line lines)
	(if (string-match "^\\(.+\\)[ \t]+\\(0x.\\{8\\}\\)$" line)
	    (insert (format "#define %s (*(volatile unsigned long *) %s\n)"
			    (substring-no-properties line
						     (match-beginning 1)
						     (match-end 1))
			    (substring-no-properties line
						     (match-beginning 2)
						     (match-end 2))))
	    (insert (format "%s\n" line)))))))

;;gcc自动编译
(defun smart-compile()
  "比较智能的C/C++编译命令
如果当前目录有makefile则用make -k编译，否则，如果是
处于c-mode，就用gcc -Wall编译，如果是c++-mode就用
g++ -Wall编译"
  (interactive)
  ;; 查找 Makefile
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))
        (command nil))
    (if (not (null
              (find t candidate-make-file-name :key
                    '(lambda (f) (file-readable-p f)))))
        (setq command "make -k ")
	;; 没有找到 Makefile ，查看当前 mode 是否是已知的可编译的模式
	(if (null (buffer-file-name (current-buffer)))
	    (message "Buffer not attached to a file, won't compile!")
	    (if (eq major-mode 'c-mode)
		(setq command
		      (concat "gcc -Wall -o "
			      (file-name-sans-extension
			       (file-name-nondirectory buffer-file-name))
			      " "
			      (file-name-nondirectory buffer-file-name)
			      " -g -lm "))
		(if (eq major-mode 'c++-mode)
		    (setq command
			  (concat "g++ -Wall -o "
				  (file-name-sans-extension
				   (file-name-nondirectory buffer-file-name))
				  " "
				  (file-name-nondirectory buffer-file-name)
				  " -g -lm "))
		    (message "Unknow mode, won't compile!")))))
    (if (not (null command))
        (let ((command (read-from-minibuffer "Compile command: " command)))
          (compile command)))))
;;--------------------functions end--------------------

;;--------------------program mode--------------------
;; C++ mode
(defun my-c++-mode-hook ()
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (setq c++-auto-hungry-initial-state 'none)
  (setq c++-tab-always-indent t)
  (c-toggle-hungry-state);;backspace 删除最多空格
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c++-empty-arglist-indent 4))
;; C mode
(defun my-c-mode-hook ()
  (setq tab-width 4)
  (c-set-style "bsd")
  (setq c-basic-offset 4)
  (define-key c-mode-map (kbd "C-c i") 'lumpy-arm-trans-region)
  (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (setq c-auto-hungry-initial-state 'none)
  (c-toggle-hungry-state)
  (setq c-tab-always-indent t)
  ;; BSD-ish indentation style
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c-brace-offset -4)
  (setq c-argdecl-indent 0)
  (setq c-label-offset -4))

;; Perl mode...
(defun my-perl-mode-hook ()
  (setq tab-width 4)
  (define-key perl-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (setq perl-indent-level 4)
  (setq perl-continued-statement-offset 4))

;; Scheme mode...
(defun my-scheme-mode-hook ()
  (define-key scheme-mode-map "\C-m" 'reindent-then-newline-and-indent))

;; Emacs-Lisp mode...
(defun my-emacs-lisp-mode-hook ()
  (define-key emacs-lisp-mode-map "\C-m" 'reindent-then-newline-and-indent))

;;python mode...
(defun my-python-mode-hook ()
  (define-key python-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (eldoc-mode t))

;;org mode...
(defun my-org-mode-hook ()
  (define-key org-mode-map "\C-m" 'reindent-then-newline-and-indent))

;;lua mode...
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; Add all of the hooks...
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'perl-mode-hook 'my-perl-mode-hook)
(add-hook 'scheme-mode-hook 'my-scheme-mode-hook)
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)
(add-hook 'python-mode-hook 'my-python-mode-hook)
(add-hook 'org-mode-hook 'my-org-mode-hook)
;;--------------------program mode end--------------------

;;--------------------others--------------------
;;ctypes高亮自定义type
(require 'ctypes)
(ctypes-auto-parse-mode 1)
;;--------------------others end--------------------



(provide 'program)
