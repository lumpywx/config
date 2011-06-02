;;--------------------sawfish--------------------
(require 'sawfish)
;;--------------------sawfish-end-------------------

;;--------------------ibuffer--------------------
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;--------------------ibuffer end--------------------

;;--------------------kill-rint--------------------
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
;;--------------------kill-rint end--------------------

;;--------------------ido mode--------------------
;fast switch buffers
(require 'ido)
(add-hook 'ido-define-mode-map-hook 'ido-my-keys)

(defun ido-my-keys ()
  "Set up the keymap for `ido'."
  
  ;; common keys
  (define-key ido-mode-map "\C-e" 'ido-edit-input)   
  (define-key ido-mode-map "\t" 'ido-complete) ;; complete partial
  (define-key ido-mode-map "\C-j" 'ido-select-text)
  (define-key ido-mode-map "\C-m" 'ido-exit-minibuffer)
  (define-key ido-mode-map "?" 'ido-completion-help) ;; list completions
  (define-key ido-mode-map [(control ? )] 'ido-restrict-to-matches)
  (define-key ido-mode-map [(control ?@)] 'ido-restrict-to-matches)
  
  ;; cycle through matches
  (define-key ido-mode-map "\C-r" 'ido-prev-match)
  (define-key ido-mode-map "\C-s" 'ido-next-match)
  (define-key ido-mode-map [right] 'ido-next-match)
  (define-key ido-mode-map [left] 'ido-prev-match)

  ;; toggles
  (define-key ido-mode-map "\C-t" 'ido-toggle-regexp) ;; same as in isearch
  (define-key ido-mode-map "\C-p" 'ido-toggle-prefix)
  (define-key ido-mode-map "\C-c" 'ido-toggle-case)
  (define-key ido-mode-map "\C-a" 'ido-toggle-ignore)

  ;; keys used in file and dir environment
  (when (memq ido-cur-item '(file dir))
    (define-key ido-mode-map "\C-b" 'ido-enter-switch-buffer)
    (define-key ido-mode-map "\C-d" 'ido-enter-dired)
    (define-key ido-mode-map "\C-f" 'ido-fallback-command)
    
    ;; cycle among directories
    ;; use [left] and [right] for matching files
    (define-key ido-mode-map [down] 'ido-next-match-dir)
    (define-key ido-mode-map [up]   'ido-prev-match-dir)
    
    ;; backspace functions
    (define-key ido-mode-map [backspace] 'ido-delete-backward-updir)
    (define-key ido-mode-map "\d"        'ido-delete-backward-updir)
    (define-key ido-mode-map [(meta backspace)] 'ido-delete-backward-word-updir)
    (define-key ido-mode-map [(control backspace)] 'ido-up-directory)
    
    ;; I can't understand this
    (define-key ido-mode-map [(meta ?d)] 'ido-wide-find-dir)
    (define-key ido-mode-map [(meta ?f)] 'ido-wide-find-file)
    (define-key ido-mode-map [(meta ?k)] 'ido-forget-work-directory)
    (define-key ido-mode-map [(meta ?m)] 'ido-make-directory)
    
    (define-key ido-mode-map [(meta down)] 'ido-next-work-directory)
    (define-key ido-mode-map [(meta up)] 'ido-prev-work-directory)
    (define-key ido-mode-map [(meta left)] 'ido-prev-work-file)
    (define-key ido-mode-map [(meta right)] 'ido-next-work-file)
    
    ;; search in the directories
    ;; use C-_ to undo this
    (define-key ido-mode-map [(meta ?s)] 'ido-merge-work-directories)
    (define-key ido-mode-map [(control ?\_)] 'ido-undo-merge-work-directory)
    )
  
  (when (eq ido-cur-item 'file)
    (define-key ido-mode-map "\C-k" 'ido-delete-file-at-head)
    (define-key ido-mode-map "\C-l" 'ido-toggle-literal)
    (define-key ido-mode-map "\C-o" 'ido-copy-current-word)
    (define-key ido-mode-map "\C-v" 'ido-toggle-vc)
    (define-key ido-mode-map "\C-w" 'ido-copy-current-file-name)
    )
  
  (when (eq ido-cur-item 'buffer)
    (define-key ido-mode-map "\C-b" 'ido-fallback-command)
    (define-key ido-mode-map "\C-f" 'ido-enter-find-file)
    (define-key ido-mode-map "\C-k" 'ido-kill-buffer-at-head)
    ))

(ido-mode t)
;;--------------------ido mode end--------------------

;;--------------------解码顺序--------------------
(setq font-encoding-alist
      (append '(("MuleTibetan-0" (tibetan . 0))
		("GB2312" (chinese-gb2312 . 0))
		("JISX0208" (japanese-jisx0208 . 0))
		("JISX0212" (japanese-jisx0212 . 0))
		("VISCII" (vietnamese-viscii-lower . 0))
		("KSC5601" (korean-ksc5601 . 0))
		("MuleArabic-0" (arabic-digit . 0))
		("MuleArabic-1" (arabic-1-column . 0))
		("MuleArabic-2" (arabic-2-column . 0))) font-encoding-alist))
;;--------------------解码顺序 end--------------------

;;--------------------goto-char--------------------
(defun wzlxx-goto-char (n char)
  "Move forward to Nth occurence of char.
Typing 'wzlxx-goto-char-key' again will move
forward to the next Nth occurence of char.
eg.C-c a g g g ..."
  (interactive "p\ncGoto char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char) 
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(define-key global-map (kbd "C-c a") 'wzlxx-goto-char)
;;--------------------goto-char end--------------------

;;--------------------标记功能--------------------
;C-, 做标记 C-. 在两文件间跑来跑去
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))
(global-set-key [(control ?\,)] 'ska-point-to-register)
(global-set-key [(control ?\.)] 'ska-jump-to-register)
;;--------------------标记功能 end--------------------

;;--------------------hippie-expand--------------------
;;hippie-expand(自动补全)
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))
(global-set-key [(meta ?/)] 'hippie-expand)
;;--------------------hippie-expand end--------------------


;;--------------------func patch-paren--------------------
;;括号匹配%可以直接在括号直接移动
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
(global-set-key "%" 'match-paren)
;;--------------------func patch-paren end--------------------

;;--------------------dired--------------------
;; C-x C-j open the directory of current buffer
(defun open-dir-of-the-cur-buffer ()
  (interactive)
  (if (buffer-file-name)
      (dired default-directory)))
(global-set-key (kbd "C-x C-j") 'open-dir-of-the-cur-buffer)
;;M-UP打开父文件夹
(defun my-dired-mode-hook ()
  (interactive)
  (define-key dired-mode-map (kbd "<M-up>" ) 'dired-up-directory)
  (define-key dired-mode-map (kbd "ESC <up>" ) 'dired-up-directory))
(add-hook 'dired-mode-hook 'my-dired-mode-hook)
;;--------------------dired end--------------------

;;--------------------mmm mode--------------------
;mmm模式可以使一个buffer里的不同代码分别按照自己的语法缩进
(autoload 'mmm-mode "mmm-mode" "Multiple Major Modes" t)
(autoload 'mmm-parse-buffer "mmm-mode" "Automatic MMM-ification" t)
;;--------------------mmm mode end--------------------

;;--------------------org-mode--------------------
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-export-html-coding-system (quote utf-8))
(setq org-export-htmlize-output-type (quote inline-css))
;;--------------------org-mode-end--------------------

;; ;;cscope
;; (add-hook 'c-mode-common-hook
;;  	  '(lambda ()
;;  	    (require 'xcscope)))
;; ;;ecb
;; (require 'ecb-autoloads)


(provide 'modes)
