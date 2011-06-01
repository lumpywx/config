;; theme file, written Sat Aug  5 17:14:01 2000
;; created by sawfish-themer -- DO NOT EDIT!

(require 'make-theme)

(let
    ((patterns-alist
      '(("close-image"
         (inactive
          "close_button2.png")
         (focused
          "close_button.png")
         (highlighted
          "close_button_over.png")
         (clicked
          "close_button_clicked.png"))
        ("menu-image"
         (inactive
          "menu_button2.png")
         (focused
          "menu_button.png")
         (highlighted
          "menu_button_over.png")
         (clicked
          "max_button_clicked.png"))
        ("min-image"
         (inactive
          "min_button2.png")
         (focused
          "min_button.png")
         (highlighted
          "min_button_over.png")
         (clicked
          "min_button_clicked.png"))
        ("max-image"
         (inactive
          "max_button2.png")
         (focused
          "max_button.png")
         (highlighted
          "max_button_over.png")
         (clicked
          "max_button_clicked.png"))
        ("bottom-left-image"
         (inactive
          "bottom_left_corner2.png")
         (focused
          "bottom_left_corner.png"))
        ("bottom-image"
         (inactive
          "horizontal_border2.png")
         (focused
          "horizontal_border.png"))
        ("bottom-right-image"
         (inactive
          "bottom_right_corner2.png")
         (focused
          "bottom_right_corner.png"))
        ("side-image"
         (inactive
          "vertical_border2.png")
         (focused
          "vertical_border.png"))
        ("title-image"
         (inactive
          "title2.png")
         (focused
          "title.png"))
        ("font-colors"
         (inactive . "#56fc690280ff")
         (focused . "#000000000000"))
        ("top-left-image"
         (inactive
          "top_left_corner2.png")
         (focused
          "top_left_corner.png"))
        ("menu-shaped-image"
         (inactive
          "menu_button_shaped2.png")
         (focused
          "menu_button_shaped.png")
         (highlighted
          "menu_button_shaped_over.png")
         (clicked
          "menu_button_shaped_over.png"))
        ("top-left-shaped-image"
         (inactive
          "top_left_corner_shaped2.png")
         (focused
          "top_left_corner_shaped.png"))
        ("top-right-image"
         (inactive
          "top_right_corner2.png")
         (focused
          "top_right_corner.png"))
        ("top-right-shaped-image"
         (inactive
          "top_right_corner_shaped2.png")
         (focused
          "top_right_corner_shaped.png"))))

     (frames-alist
      '(("frame"
         ((top-edge . -20)
          (height . 20)
          (left-edge . 48)
          (right-edge . 19)
          (cursor . left-cursor)
          (foreground . "font-colors")
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
         ((left-edge . -5)
          (top-edge . 0)
          (bottom-edge . 0)
          (background . "side-image")
          (class . left-border))
         ((right-edge . -5)
          (top-edge . 0)
          (bottom-edge . 0)
          (background . "side-image")
          (class . right-border))
         ((bottom-edge . -5)
          (right-edge . -5)
          (background . "bottom-right-image")
          (class . bottom-right-corner))
         ((left-edge . 0)
          (right-edge . 0)
          (bottom-edge . -5)
          (background . "bottom-image")
          (class . bottom-border))
         ((left-edge . -5)
          (bottom-edge . -5)
          (background . "bottom-left-image")
          (class . bottom-left-corner))
         ((cursor . left-cursor)
          (left-edge . 40)
          (top-edge . -20)
          (background . "max-image")
          (class . maximize-button))
         ((cursor . left-cursor)
          (left-edge . 19)
          (top-edge . -20)
          (background . "min-image")
          (class . iconify-button))
         ((cursor . left-cursor)
          (right-edge . 0)
          (top-edge . -20)
          (background . "menu-image")
          (class . menu-button))
         ((cursor . left-cursor)
          (left-edge . 0)
          (background . "close-image")
          (top-edge . -20)
          (class . close-button))
         ((left-edge . -5)
          (background . "top-left-image")
          (class . top-left-corner)
          (top-edge . -20))
         ((right-edge . -5)
          (top-edge . -20)
          (background . "top-right-image")
          (class . top-right-corner)))
        ("shaped-frame"
         ((left-edge . 48)
          (cursor . left-cursor)
          (right-edge . 19)
          (height . 20)
          (foreground . "font-colors")
          (top-edge . -20)
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
         ((cursor . left-cursor)
          (left-edge . 0)
          (top-edge . -20)
          (background . "close-image")
          (class . close-button))
         ((cursor . left-cursor)
          (left-edge . 40)
          (top-edge . -20)
          (background . "max-image")
          (class . maximize-button))
         ((cursor . left-cursor)
          (left-edge . 19)
          (top-edge . -20)
          (background . "min-image")
          (class . iconify-button))
         ((cursor . left-cursor)
          (right-edge . 0)
          (top-edge . -20)
          (background . "menu-shaped-image")
          (class . menu-button))
         ((left-edge . -5)
          (background . "top-left-shaped-image")
          (top-edge . -20)
          (class . top-left-corner))
         ((background . "top-right-shaped-image")
          (top-edge . -20)
          (right-edge . -5)
          (class . top-right-corner)))
        ("transient-frame"
         ((cursor . left-cursor)
          (left-edge . 14)
          (right-edge . 19)
          (top-edge . -20)
          (height . 20)
          (foreground . "font-colors")
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
         ((left-edge . -5)
          (bottom-edge . 0)
          (top-edge . 0)
          (background . "side-image")
          (class . left-border))
         ((right-edge . -5)
          (top-edge . 0)
          (bottom-edge . 0)
          (background . "side-image")
          (class . right-border))
         ((bottom-edge . -5)
          (right-edge . -5)
          (background . "bottom-right-image")
          (class . bottom-right-corner))
         ((left-edge . 0)
          (right-edge . 0)
          (bottom-edge . -5)
          (background . "bottom-image")
          (class . bottom-border))
         ((bottom-edge . -5)
          (left-edge . -5)
          (background . "bottom-left-image")
          (class . bottom-left-corner))
         ((cursor . left-cursor)
          (left-edge . 0)
          (top-edge . -20)
          (background . "close-image")
          (class . close-button))
         ((cursor . left-cursor)
          (right-edge . 0)
          (top-edge . -20)
          (background . "menu-image")
          (class . menu-button))
         ((background . "top-left-image")
          (left-edge . -5)
          (class . top-left-corner)
          (top-edge . -20))
         ((background . "top-right-image")
          (right-edge . -5)
          (top-edge . -20)
          (class . top-right-corner)))
        ("shaped-transient-frame"
         ((left-edge . 14)
          (cursor . left-cursor)
          (right-edge . 19)
          (top-edge . -20)
          (height . 20)
          (foreground . "font-colors")
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
         ((cursor . left-cursor)
          (left-edge . 0)
          (top-edge . -20)
          (background . "close-image")
          (class . close-button))
         ((right-edge . 0)
          (top-edge . -20)
          (background . "menu-shaped-image")
          (class . menu-button))
         ((cursor . left-cursor)
          (left-edge . -5)
          (background . "top-left-shaped-image")
          (class . top-left-corner)
          (top-edge . -20))
         ((background . "top-right-shaped-image")
          (right-edge . -5)
          (top-edge . -20)
          (class . top-right-corner)))
        ("shaded"
         ((cursor . left-cursor)
          (left-edge . 48)
          (right-edge . 19)
          (height . 20)
          (foreground . "font-colors")
          (top-edge . -20)
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
         ((left-edge . 0)
          (cursor . left-cursor)
          (top-edge . -20)
          (background . "close-image")
          (class . close-button))
         ((cursor . left-cursor)
          (left-edge . 40)
          (top-edge . -20)
          (background . "max-image")
          (class . maximize-button))
         ((cursor . left-cursor)
          (left-edge . 19)
          (top-edge . -20)
          (background . "min-image")
          (class . iconify-button))
         ((cursor . left-cursor)
          (right-edge . 0)
          (top-edge . -20)
          (background . "menu-shaped-image")
          (class . menu-button))
         ((left-edge . -5)
          (background . "top-left-shaped-image")
          (top-edge . -20)
          (class . top-left-corner))
         ((background . "top-right-shaped-image")
          (top-edge . -20)
          (right-edge . -5)
          (class . top-right-corner)))
        ("shaded-transient"
         ((left-edge . 14)
          (cursor . left-cursor)
          (right-edge . 19)
          (top-edge . -20)
          (height . 20)
          (foreground . "font-colors")
          (background . "title-image")
          (class . title)
          (text . window-name)
          (x-justify . center)
          (y-justify . center))
         ((cursor . left-cursor)
          (left-edge . 0)
          (top-edge . -20)
          (background . "close-image")
          (class . close-button))
         ((right-edge . 0)
          (top-edge . -20)
          (background . "menu-shaped-image")
          (class . menu-button))
         ((cursor . left-cursor)
          (left-edge . -5)
          (background . "top-left-shaped-image")
          (class . top-left-corner)
          (top-edge . -20))
         ((background . "top-right-shaped-image")
          (right-edge . -5)
          (top-edge . -20)
          (class . top-right-corner)))))

     (mapping-alist
      '((default . "frame")
        (transient . "transient-frame")
        (shaped . "shaped-frame")
        (shaped-transient . "shaped-transient-frame")
        (unframed . "nil")))

     (theme-name 'Aquaified))

  (add-frame-style
   theme-name (make-theme patterns-alist frames-alist mapping-alist))
  (when (boundp 'mark-frame-style-editable)
    (mark-frame-style-editable theme-name)))