;; Aquarius/theme.jl

(require 'make-theme)

(let
  ((patterns-alist
    '(("close-image"
	 (inactive
         "inact_button.png")
         (focused
         "close_button.png")
         (highlighted
         "close_button_over.png")
         (clicked
         "close_button_clicked.png"))

	 ("resize-tab"
	  (inactive
	  "resize_tab.png")
	  (focused
	  "resize_tab.png"))
	  
        ("menu-image"
         (inactive
         "menu_button2.png")
         (focused
         "menu_button.png")
         (highlighted
         "menu_button_over.png")
         (clicked
         "menu_button_clicked.png"))
	 
        ("min-image"
         (inactive
         "inact_button.png")
         (focused
         "min_button.png")
         (highlighted
         "min_button_over.png")
         (clicked
         "min_button_clicked.png"))
	 
        ("max-image"
         (inactive
         "inact_button.png")
         (focused
         "max_button.png")
         (highlighted
         "max_button_over.png")
         (clicked
         "max_button_clicked.png"))
	 
        ("bottom-left-image"
	 (inactive
	 "horizontal_border.png")
         (focused
         "horizontal_border.png"))
         
	("bottom-image"
	 (inactive
	 "horizontal_border.png") 
         (focused
         "horizontal_border.png"))
	 
	("bottom-right-image"
	 (inactive
	 "horizontal_border.png")
         (focused
         "horizontal_border.png"))
	 
        ("side-image"
	 (inactive
	 "vertical_border.png")
         (focused
         "vertical_border.png"))
	 
        ("title-image"
         (inactive
         "title2.png")
         (focused
         "title.png"))
	 
        ("font-colors"
         (inactive . "#707070")
         (focused . "#000000"))
	 
        ("top-left-image"
         (inactive
         "top_left_corner2.png")
         (focused
         "top_left_corner.png"))
	 
        ("top-right-image"
         (inactive
         "top_right_corner2.png")
         (focused
         "top_right_corner.png"))
	 
	 ))

     (frames-alist
      '(("frame"
         
	((top-edge . -23)
	 (height . 23)
	 (left-edge . 48)
	 (right-edge . 19)
	 (cursor . left-cursor)
	 (foreground . "font-colors")
	 (background . "title-image")
	 (class . title)
	 (text . window-name)
	 (x-justify . center)
	 (y-justify . center))
 
	 ((background . "resize-tab")
	  (right-edge . 0)
	  (bottom-edge . 0)
	  (class . bottom-right-corner))
	  
         ((left-edge . -1)
          (top-edge . 0)
          (bottom-edge . 0)
          (background . "side-image")
          (class . left-border))
	  
         ((right-edge . -1)
          (top-edge . 0)
          (bottom-edge . 0)
          (background . "side-image")
          (class . right-border))
	  
         ((left-edge . -1)
          (right-edge . -1)
          (bottom-edge . -1)
          (background . "bottom-image")
          (class . bottom-border))
	  
         ((cursor . left-cursor)
          (left-edge . 52)
          (top-edge . -23)
          (background . "max-image")
          (class . maximize-button))
	  
         ((cursor . left-cursor)
          (left-edge . 30)
          (top-edge . -23)
          (background . "min-image")
          (class . iconify-button))
	  
         ((cursor . left-cursor)
          (right-edge . 8)
          (top-edge . -23)
          (background . "menu-image")
          (class . menu-button))
	  
         ((cursor . left-cursor)
          (left-edge . 8)
          (background . "close-image")
          (top-edge . -23)
          (class . close-button))
	  
         ((left-edge . -1)
          (background . "top-left-image")
	  (cursor . left-cursor)
          (class . title)
          (top-edge . -23))
	  
         ((right-edge . -1)
          (top-edge . -23)
          (background . "top-right-image")
	  (cursor . left-cursor)
          (class . title))
	  )
	  
        ("shaped-frame"
         ((left-edge . 48)
          (cursor . left-cursor)
          (right-edge . 19)
          (height . 23)
          (foreground . "font-colors")
          (top-edge . -23)
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
	  
         ((cursor . left-cursor)
          (left-edge . 8)
          (top-edge . -23)
          (background . "close-image")
          (class . close-button))
	  
         ((cursor . left-cursor)
          (left-edge . 52)
          (top-edge . -23)
          (background . "max-image")
          (class . maximize-button))
	  
         ((cursor . left-cursor)
          (left-edge . 30)
          (top-edge . -23)
          (background . "min-image")
          (class . iconify-button))
	  
         ((cursor . left-cursor)
          (right-edge . 8)
          (top-edge . -23)
          (background . "menu-image")
          (class . menu-button))
	  
         ((left-edge . -1)
          (background . "top-left-image")
	  (cursor . left-cursor)
          (top-edge . -23)
          (class . title))
	  
         ((background . "top-right-image")
	  (cursor . left-cursor)
          (top-edge . -23)
          (right-edge . -1)
          (class . title))
	  )
	  
        ("transient-frame"
         ((cursor . left-cursor)
          (left-edge . 14)
          (right-edge . 19)
          (top-edge . -23)
          (height . 23)
          (foreground . "font-colors")
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
         
	 ((left-edge . -1)
          (bottom-edge . 0)
          (top-edge . 0)
          (background . "side-image")
          (class . left-border))
         
	 ((right-edge . -1)
          (top-edge . 0)
          (bottom-edge . 0)
          (background . "side-image")
          (class . right-border))
         
	 ((bottom-edge . 0)
          (right-edge . 0)
          (background . "resize-tab")
          (class . bottom-right-corner))
         
	 ((left-edge . -1)
          (right-edge . -1)
          (bottom-edge . -1)
          (background . "bottom-image")
          (class . bottom-border))
         
	 ((cursor . left-cursor)
          (left-edge . 8)
          (top-edge . -23)
          (background . "close-image")
          (class . close-button))
         
	 ((cursor . left-cursor)
          (right-edge . 8)
          (top-edge . -23)
          (background . "menu-image")
          (class . menu-button))
         
	 ((background . "top-left-image")
	  (cursor . left-cursor)
          (left-edge . -1)
          (class . title)
          (top-edge . -23))

	 ((background . "top-right-image")
	  (cursor . left-cursor)
          (right-edge . -1)
          (top-edge . -23)
          (class . title))
	  )
	  
        ("shaped-transient-frame"
         ((left-edge . 14)
          (cursor . left-cursor)
          (right-edge . 19)
          (top-edge . -23)
          (height . 23)
          (foreground . "font-colors")
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
         
	 ((cursor . left-cursor)
          (left-edge . 8)
          (top-edge . -23)
          (background . "close-image")
          (class . close-button))
         
	 ((right-edge . 8)
          (top-edge . -23)
          (background . "menu-image")
          (class . menu-button))
         
	 ((cursor . left-cursor)
          (left-edge . -1)
          (background . "top-left-image")
	  (cursor . left-cursor)
          (class . title)
          (top-edge . -23))
         
	 ((background . "top-right-image")
	  (cursor . left-cursor)
          (right-edge . -1)
          (top-edge . -23)
          (class . title))
	  )
	  
        ("shaded"
         ((cursor . left-cursor)
          (left-edge . 48)
          (right-edge . 19)
          (height . 23)
          (foreground . "font-colors")
          (top-edge . -23)
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
         
	 ((left-edge . 8)
          (cursor . left-cursor)
          (top-edge . -23)
          (background . "close-image")
          (class . close-button))
         
	 ((cursor . left-cursor)
          (left-edge . 52)
          (top-edge . -23)
          (background . "max-image")
          (class . maximize-button))
         
	 ((cursor . left-cursor)
          (left-edge . 30)
          (top-edge . -23)
          (background . "min-image")
          (class . iconify-button))
         
	 ((cursor . left-cursor)
          (right-edge . 8)
          (top-edge . -23)
          (background . "menu-image")
          (class . menu-button))
         
	 ((left-edge . -1)
          (background . "top-left-image")
	  (cursor . left-cursor)
          (top-edge . -23)
          (class . title))
         
	 ((background . "top-right-image")
	  (cursor . left-cursor)
          (top-edge . -23)
          (right-edge . -1)
          (class . title))
	  )
	  
        ("shaded-transient"
         ((left-edge . 14)
          (cursor . left-cursor)
          (right-edge . 19)
          (top-edge . -23)
          (height . 23)
          (foreground . "font-colors")
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
         
	 ((cursor . left-cursor)
          (left-edge . 8)
          (top-edge . -23)
          (background . "close-image")
          (class . close-button))
         
	 ((right-edge . 8)
          (top-edge . -23)
          (background . "menu-image")
          (class . menu-button))
         
	 ((cursor . left-cursor)
          (left-edge . -1)
          (background . "top-left-image")
	  (cursor . left-cursor)
          (class . title)
          (top-edge . -23))
         
	 ((background . "top-right-image")
	  (cursor . left-cursor)
          (right-edge . -1)
          (top-edge . -23)
          (class . title)))
	  ))


	(mapping-alist
	'((default . "frame")
	 (transient . "transient-frame")
         (shaped . "shaped-frame")
	 (shaped-transient . "shaped-transient-frame")
	 (unframed . "nil")))
	 
	 (theme-name 'Aquarius))

	(add-frame-style
	 theme-name (make-theme patterns-alist frames-alist mapping-alist))
	(when (boundp 'mark-frame-style-editable)
         (mark-frame-style-editable theme-name)))
	 
