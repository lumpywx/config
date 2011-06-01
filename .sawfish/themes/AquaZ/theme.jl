; AquaOS2/theme.jl

(defgroup AquaZ-frame "AquaOS Frame")

(defcustom AquaZ:active-text "black"
  "Colour of active text."
  :group AquaZ-frame
  :type color)

(defcustom AquaZ:inactive-text "#576981"
  "Colour of inactive text."
  :group AquaZ-frame
  :type color)  

(defcustom AquaZ:active-title "title.png"
  "Bar for active title."
  :group AquaZ-frame
  :type file-name)
  
(defcustom AquaZ:inactive-title "title2.png"
  "Bar for inactive title."
  :group AquaZ-frame
  :type file-name)

(let*
  (
    (font-colors (list AquaZ:inactive-text
                       AquaZ:active-text))
    
    (close-image (list (make-image "close_button2.png")
                       (make-image "close_button.png")
                       (make-image "close_button_over.png")
                       (make-image "close_button_click.png")))
    (max-image (list (make-image "max_button2.png")
                     (make-image "max_button.png")
                     (make-image "max_button_over.png")
                     (make-image "max_button_click.png")))
    (min-image (list (make-image "min_button2.png")
                     (make-image "min_button.png")
                     (make-image "min_button_over.png")
                     (make-image "min_button_click.png")))
    (menu-image (list (make-image "menu_button2.png")
                      (make-image "menu_button.png")
                      (make-image "menu_button_over.png")
                      (make-image "menu_button_click.png")))
    (title-image (list (make-image AquaZ:inactive-title)
                       (make-image AquaZ:active-title)))
    (top-left-image (make-image "top_left_button_area.png"))
    (top-left-shaped-image (make-image "top_left_button_area_shaped.png"))
    (top-right-image (make-image "top_right_button_area.png"))
    (bottom-left-image (list (make-image "bottom_left_corner2.png")
                             (make-image "bottom_left_corner.png")))
    (bottom-image (list (make-image "horizontal_border2.png")
	                (make-image "horizontal_border.png")))
    (bottom-right-image (list (make-image "bottom_right_corner2.png")
                              (make-image "bottom_right_corner.png")))
    (side-image (list (make-image "vertical_border2.png")
                      (make-image "vertical_border.png")))

    (frame `(
        ((background . ,top-left-image)
         (top-edge . -20)
         (left-edge . -5)
         (class . title))
        ((background . ,title-image)
         (foreground . ,font-colors)
         (text . ,window-name)
         (x-justify . left)
         (y-justify . center)
         (left-edge . 19)
         (right-edge . 48)
         (top-edge . -20)
         (height . 20)
			(cursor . left_ptr)
         (class . title))
        ((background . ,top-right-image)
         (right-edge . -5)
         (top-edge . -20)
         (class . title))
        ((background . ,side-image)
         (left-edge . -5)
         (top-edge . 0)
         (bottom-edge . 0)
         (class . left-border))
        ((background . ,side-image)
         (right-edge . -5)
         (top-edge . 0)
         (bottom-edge . 0)
         (class . right-border))
        ((background . ,bottom-left-image)
         (left-edge . -5)
         (bottom-edge . -5)
         (class . bottom-left-corner))
        ((background . ,bottom-image)
         (left-edge . 0)
         (right-edge .0)
         (bottom-edge . -5)
         (class . bottom-border))
        ((background . ,bottom-right-image)
         (right-edge . -5)
         (bottom-edge . -5)
         (class . bottom-right-corner))
        
        ((background . ,close-image)
         (right-edge . -5)
         (top-edge . -20)
			(cursor . left_ptr)
         (class . close-button))
        ((background . ,max-image)
         (right-edge . 19)
         (top-edge . -20)
			(cursor . left_ptr)
         (class . maximize-button))
        ((background . ,min-image)
         (right-edge . 40)
         (top-edge . -20)
			(cursor . left_ptr)
         (class . iconify-button))
        ((background . ,menu-image)
         (left-edge . -5)
         (top-edge . -20)
			(cursor . hand2)
         (class . menu-button))
      ))
      
    (shaped-frame `(
        ((background . ,top-left-shaped-image)
         (top-edge . -20)
         (left-edge . 19)
         (class . title))
        ((background . ,title-image)
         (foreground . ,font-colors)
         (text . ,window-name)
         (x-justify . left)
         (y-justify . center)
         (left-edge . 19)
         (right-edge . 48)
         (top-edge . -20)
			(cursor . left_ptr)
         (height . 20)
         (class . title))
        ((background . ,top-right-image)
         (right-edge . -5)
         (top-edge . -20)
         (class . title))
        
        ((background . ,close-image)
         (right-edge . -5)
         (top-edge . -20)
			(cursor . left_ptr)
         (class . close-button))
        ((background . ,max-image)
         (right-edge . 19)
         (top-edge . -20)
			(cursor . left_ptr)
         (class . maximize-button))
        ((background . ,min-image)
         (right-edge . 40)
         (top-edge . -20)
			(cursor . left_ptr)
         (class . iconify-button))
        ((background . ,menu-image)
         (left-edge . -5)
         (top-edge . -20)
			(cursor . hand2)
         (class . menu-button))
      ))
      
    (transient-frame `(
        ((background . ,top-left-image)
         (top-edge . -20)
         (left-edge . -5)
         (class . title))
        ((background . ,title-image)
         (foreground . ,font-colors)
         (text . ,window-name)
         (x-justify . left)
         (y-justify . center)
         (left-edge . 19)
         (right-edge . 14)
         (top-edge . -20)
			(cursor . left_ptr)
         (height . 20)
         (class . title))
        ((background . ,top-right-image)
         (right-edge . -5)
         (top-edge . -20)
         (class . title))
        ((background . ,side-image)
         (left-edge . -5)
         (top-edge . 0)
         (bottom-edge . 0)
         (class . left-border))
        ((background . ,side-image)
         (right-edge . -5)
         (top-edge . 0)
         (bottom-edge . 0)
         (class . right-border))
        ((background . ,bottom-left-image)
         (left-edge . -5)
         (bottom-edge . -5)
         (class . bottom-left-corner))
        ((background . ,bottom-image)
         (left-edge . 0)
         (right-edge .0)
         (bottom-edge . -5)
         (class . bottom-border))
        ((background . ,bottom-right-image)
         (right-edge . -5)
         (bottom-edge . -5)
         (class . bottom-right-corner))
        
        ((background . ,close-image)
         (right-edge . -5)
         (top-edge . -20)
			(cursor . left_ptr)
         (class . close-button))
        ((background . ,menu-image)
         (left-edge . -5)
         (top-edge . -20)
			(cursor . hand2)
         (class . menu-button))
      ))
      
    (shaped-transient-frame `(
        ((background . ,top-left-shaped-image)
         (top-edge . -20)
         (left-edge . 0)
         (class . title))
        ((background . ,title-image)
         (foreground . ,font-colors)
         (text . ,window-name)
         (x-justify . left)
         (y-justify . center)
         (left-edge .19)
         (right-edge . 14)
         (top-edge . -20)
			(cursor . left_ptr)
         (height . 20)
         (class . title))
        ((background . ,top-right-image)
         (right-edge . -5)
         (top-edge . -20)
         (class . title))
        
        ((background . ,close-image)
         (right-edge . 0)
         (top-edge . -20)
			(cursor . left_ptr)
         (class . close-button))
        ((background . ,menu-image)
         (left-edge . 0)
         (top-edge . -20)
			(cursor . hand2)
         (class . menu-button))
      ))

   )
      
  (add-frame-style 'AquaZ
    (lambda (w type)
      (cond 
            ((eq type 'transient) transient-frame)
            ((eq type 'shaped-transient) shaped-transient-frame)
            ((eq type 'shaped) shaped-frame)
            ((eq type 'unframed) nil-frame)
            (t frame))))            
)
