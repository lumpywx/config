(require 'erc)
(require 'erc-nick-notify)

;;个人信息
(setq erc-nick "wzlxx")
(setq erc-away-nickname "wzlxx{away}")
(setq erc-user-full-name "lumpy@wzlxx")

;;设置 nickname 右对齐，最右端在 15 个字符的地方。
(setq erc-fill-function 'erc-fill-static)
(setq erc-fill-static-center 15)

;; Auto un-away
					;(setq erc-auto-discard-away t)
;; Do not make nicks as buttons
(setq erc-button-buttonize-nicks nil)

;;屏蔽信息
(setq erc-hide-list '("NICK" "JOIN" "PART" "QUIT"))
;; Don't track server buffer
(setq erc-track-exclude-server-buffer t)

;;用频道名当提示符
(setq erc-prompt (lambda ()
                   (if (and (boundp 'erc-default-recipients)
                            (erc-default-target))
                       (erc-propertize (concat (erc-default-target) ">")
                                       'read-only t
                                       'rear-nonsticky t
                                       'front-nonsticky t)
		       (erc-propertize (concat "ERC>")
				       'read-only t
				       'rear-nonsticky t
				       'front-nonsticky t))))

;;自动进入频道
(setq erc-autojoin-channels-alist '(("freenode.net"
                                     "#ubuntu-cn" )))

;;这些人有动作的时候会在 mode line 中用醒目的颜色显示
(setq erc-pals '("xiangfu" "MaskRay" "pocoyo" "ofan" "cfy" "iGoogle" "roylez"))

;;离开信息
(setq erc-quit-reason-various-alist
      '(("dinner" "Having dinner...")
        ("z" "Zzz...")
        ("^$" yow)))
(setq erc-quit-reason 'erc-quit-reason-various)

;; buffer太大的时候自动删除旧buffer
(defvar erc-insert-post-hook)
(add-hook 'erc-insert-post-hook
          'erc-truncate-buffer)
(setq erc-truncate-buffer-on-save t)

;;自动登录服务器
(defun erc-start ()
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick erc-nick :password ))

;;erc commond
(defun erc-cmd-THINK (&rest line)
  (interactive)
  (let ((text
         (concat ".oO{ "
                 (erc-trim-string (mapconcat 'identity line " "))
                 " }")))
    (erc-send-action (erc-default-target) text)))

(defun erc-cmd-HOWMANY (&rest ignore)
  "Display how many users (and ops) the current channel has."
  (interactive)
  (erc-display-message nil 'notice (current-buffer)
                       (let ((hash-table (with-current-buffer
                                             (erc-server-buffer)
                                           erc-server-users))
                             (users 0)
                             (ops 0))
                         (maphash (lambda (k v)
                                    (when (member (current-buffer)
                                                  (erc-server-user-buffers v))
                                      (incf users))
                                    (when (erc-channel-user-op-p k)
                                      (incf ops)))
                                  hash-table)
                         (format
                          "There are %s users (%s ops) on the current channel"
                          users ops))))

;; Show elisp and eval result
(defun erc-cmd-SHOW (&rest form)
  "Eval FORM and send the result and the original form as:
 FORM => (eval FORM)."
  (interactive)
  (let* ((form-string (mapconcat 'identity form " "))
         (result
          (condition-case err
              (eval (read-from-whole-string form-string))
            (error
             (format "Error: %s" error)))))
    (erc-send-message (format "%s => %S" form-string result))))



(provide 'erc)
