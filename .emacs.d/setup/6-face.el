;;frame字体设置
(defun wzlxx-fonts ()
  ;;如果在文本模式不支持xtf字体的情况下会只用默认字体
  (set-default-font "Monospace-10")
  (set-fontset-font "fontset-default"
		    'gb18030 '("wenquanyi bitmap song" . "unicode-bmp")))

(defun lumpy-x-set ()
  (if window-system
      (progn
	(my-color-theme)
	(wzlxx-fonts))))

;;把一些外观放到这里才能被client使用
(if (and (fboundp 'daemonp) (daemonp))
    ;;daemon设置
    (add-hook 'after-make-frame-functions
 	      (lambda (new-frame)
 		(with-selected-frame new-frame
		  (lumpy-x-set)
 		  )))
    (lumpy-x-set))

(provide 'face)
