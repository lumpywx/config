;; theme file, written Tue Mar 21 03:44:55 2000
;; created by sawmill-themer -- DO NOT EDIT!

(require 'make-theme)

(let
    ((patterns-alist
      '(("menu"
         (inactive
          "menu-unselected.png"
          (tiled . t))
         (focused
          "menu.png"
          (tiled . t)))
        ("bottom-middle"
         (inactive
          "bottom-border-unselected.png"
          (tiled . t))
         (focused
          "bottom-border.png"
          (tiled . t)))
        ("middle-border"
         (inactive
          "middle-border-unselected.png")
         (focused
          "middle-border.png"
          (tiled . t)))
        ("close"
         (inactive
          "close-unselected.png")
         (focused
          "close.png")
         (highlighted
          "close-highlighted.png")
         (clicked
          "button-clicked.png")
         (inactive-clicked
          "button-unselected-clicked.png"))
        ("maximize"
         (inactive
          "maximize-unselected.png")
         (focused
          "maximize.png")
         (highlighted
          "maximize-highlighted.png")
         (clicked
          "button-clicked.png")
         (inactive-clicked
          "button-unselected-clicked.png"))
        ("iconify"
         (inactive
          "iconify-unselected.png")
         (focused
          "iconify.png")
         (highlighted
          "iconify-highlighted.png")
         (clicked
          "button-clicked.png")
         (inactive-clicked
          "button-unselected-clicked.png"))
        ("top-left"
         (inactive
          "top-left-border-unselected.png")
         (focused
          "top-left-border.png"))
        ("bottom-left-border"
         (inactive
          "bottom-left-border-unselected.png")
         (focused
          "bottom-left-border.png"))
        ("bottom-right-border"
         (inactive
          "bottom-right-border-unselected.png")
         (focused
          "bottom-right-border.png"))
        ("top-right-border"
         (inactive
          "top-right-border-unselected.png")
         (focused
          "top-right-border.png"))
        ("menu-button"
         (inactive
          "menu-button-unselected.png")
         (focused
          "menu-button.png")
         (highlighted
          "menu-button-highlighted.png")
         (clicked
          "button-clicked.png")
         (inactive-clicked
          "button-unselected-clicked.png"))
        ("top-left-border-shaped"
         (inactive
          "top-left-border-shaped-unselected.png")
         (focused
          "top-left-border-shaped.png"))
        ("top-right-border-shaped"
         (inactive
          "top-right-border-shaped-unselected.png")
         (focused
          "top-right-border-shaped.png"))))

     (frames-alist
      '(("normal"
         ((right-edge . 10)
          (left-edge . 10)
          (bottom-edge . -5)
          (background . "bottom-middle")
          (class . bottom-border))
         ((left-edge . 16)
          (right-edge . 48)
          (top-edge . -22)
          (x-justify . 6)
          (foreground . "#01e501e801f0")
          (y-justify . center)
          (text . window-name)
          (background . "menu")
          (class . title))
         ((left-edge . -5)
          (background . "top-left")
          (top-edge . -22)
          (class . title))
         ((left-edge . -5)
          (class . close-button))
         ((bottom-edge . -5)
          (left-edge . -5)
          (background . "bottom-left-border")
          (class . bottom-left-corner))
         ((right-edge . -5)
          (background . "bottom-right-border")
          (bottom-edge . -5)
          (class . bottom-right-corner))
         ((bottom-edge . 10)
          (top-edge . 0)
          (left-edge . -5)
          (background . "middle-border")
          (class . left-border))
         ((right-edge . -5)
          (bottom-edge . 10)
          (top-edge . 0)
          (background . "middle-border")
          (class . right-border))
         ((top-edge . -22)
          (right-edge . 32)
          (background . "iconify")
          (class . iconify-button))
         ((right-edge . 16)
          (top-edge . -22)
          (background . "maximize")
          (class . maximize-button))
         ((right-edge . 0)
          (top-edge . -22)
          (background . "close")
          (class . close-button))
         ((right-edge . -5)
          (top-edge . -22)
          (background . "top-right-border")
          (class . title))
         ((width . 10)
          (bottom-edge . -5)
          (left-edge . 0)
          (class . bottom-left-corner)
          (background . "bottom-middle"))
         ((right-edge . 0)
          (bottom-edge . -5)
          (background . "bottom-middle")
          (width . 10)
          (class . bottom-right-corner))
         ((bottom-edge . 0)
          (height . 10)
          (left-edge . -5)
          (background . "middle-border")
          (class . bottom-left-corner))
         ((right-edge . -5)
          (height . 10)
          (background . "middle-border")
          (bottom-edge . 0)
          (class . bottom-right-corner))
         ((left-edge . 0)
          (y-justify . center)
          (x-justify . center)
          (background . "menu-button")
          (top-edge . -22)
          (class . menu-button)))
        ("shaped"
         ((left-edge . 16)
          (right-edge . 48)
          (top-edge . -22)
          (x-justify . 6)
          (y-justify . center)
          (text . window-name)
          (background . "menu")
          (class . title))
         ((left-edge . -5)
          (background . "top-left-border-shaped")
          (top-edge . -22)
          (class . title))
         ((left-edge . -5)
          (class . close-button))
         ((right-edge . 32)
          (top-edge . -22)
          (background . "iconify")
          (class . iconify-button))
         ((right-edge . 16)
          (top-edge . -22)
          (background . "maximize")
          (class . maximize-button))
         ((right-edge . 0)
          (top-edge . -22)
          (background . "close")
          (class . close-button))
         ((right-edge . -5)
          (top-edge . -22)
          (background . "top-right-border-shaped")
          (class . title))
         ((left-edge . 0)
          (y-justify . center)
          (x-justify . center)
          (background . "menu-button")
          (top-edge . -22)
          (class . menu-button)))
        ("dialog"
         ((bottom-edge . -5)
          (right-edge . 10)
          (left-edge . 10)
          (background . "bottom-middle")
          (class . bottom-border))
         ((left-edge . 16)
          (right-edge . 16)
          (x-justify . 6)
          (y-justify . center)
          (text . window-name)
          (top-edge . -22)
          (background . "menu")
          (class . title))
         ((left-edge . -5)
          (background . "top-left")
          (top-edge . -22)
          (class . title))
         ((left-edge . -5)
          (class . close-button))
         ((bottom-edge . -5)
          (left-edge . -5)
          (background . "bottom-left-border")
          (class . bottom-left-corner))
         ((right-edge . -5)
          (background . "bottom-right-border")
          (bottom-edge . -5)
          (class . bottom-right-corner))
         ((bottom-edge . 10)
          (top-edge . 0)
          (left-edge . -5)
          (background . "middle-border")
          (class . left-border))
         ((right-edge . -5)
          (bottom-edge . 10)
          (top-edge . 0)
          (background . "middle-border")
          (class . right-border))
         ((top-edge . -22)
          (right-edge . 0)
          (background . "close")
          (class . close-button))
         ((right-edge . -5)
          (top-edge . -22)
          (background . "top-right-border")
          (class . title))
         ((width . 10)
          (bottom-edge . -5)
          (left-edge . 0)
          (class . bottom-left-corner)
          (background . "bottom-middle"))
         ((right-edge . 0)
          (background . "bottom-middle")
          (width . 10)
          (bottom-edge . -5)
          (class . bottom-right-corner))
         ((left-edge . -5)
          (background . "middle-border")
          (bottom-edge . 0)
          (height . 10)
          (class . bottom-left-corner))
         ((height . 10)
          (background . "middle-border")
          (right-edge . -5)
          (bottom-edge . 0)
          (class . bottom-right-corner))
         ((y-justify . center)
          (x-justify . center)
          (background . "menu-button")
          (left-edge . 0)
          (top-edge . -22)
          (class . menu-button)))
        ("dialog-shaped"
         ((right-edge . 16)
          (left-edge . 16)
          (top-edge . -22)
          (x-justify . 6)
          (y-justify . center)
          (text . window-name)
          (background . "menu")
          (class . title))
         ((left-edge . -5)
          (background . "top-left-border-shaped")
          (top-edge . -22)
          (class . title))
         ((left-edge . -5)
          (class . close-button))
         ((right-edge . 0)
          (top-edge . -22)
          (background . "close")
          (class . close-button))
         ((right-edge . -5)
          (top-edge . -22)
          (background . "top-right-border-shaped")
          (class . title))
         ((left-edge . 0)
          (y-justify . center)
          (x-justify . center)
          (background . "menu-button")
          (top-edge . -22)
          (class . menu-button)))))

     (mapping-alist
      '((default . "normal")
        (shaped . "shaped")
        (transient . "dialog")
        (shaped-transient . "dialog-shaped")
        (unframed . "")))

     (theme-name 'coolGrey))

  (add-frame-style
   theme-name (make-theme patterns-alist frames-alist mapping-alist))
  (when (boundp 'mark-frame-style-editable)
    (mark-frame-style-editable theme-name)))
