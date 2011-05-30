;;--------------------global-key--------------------
(global-set-key (kbd "C-SPC") 'nil)
(global-set-key "\M-r" 'replace-string)
(global-set-key "\M-g" 'goto-line)
(global-set-key [f1] 'manual-entry)
(global-set-key [f2] 'delete-other-windows)
(global-set-key [f3] 'other-window)
(global-set-key [f4] 'dired)
(global-set-key [f5] 'eval-current-buffer)
(global-set-key [f6] 'repeat-complex-command)
(global-set-key [f7] 'eshell)
(global-set-key [f8] 'grep)
(global-set-key [f9] 'previous-error)
(global-set-key [f10] 'next-error)
(global-set-key [f11] 'smart-compile)
(global-set-key [f12] 'gdb)
;;--------------------global-key end--------------------



(provide 'keybinding)
