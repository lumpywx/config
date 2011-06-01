;; AquaX/theme.jl
;;    Copyright (C) 2000 Kevin D. Knerr, Sr. <ld_barthel@yahoo.com>
;; $Revision: 1.0.2 $
;;
;; See the file ChangeLog for details of changes to this theme.
;;
;; Requires sawfish v0.31 or later

;; AquaX is free software distributed under the terms
;; of the GNU General Public License, version 2, as published by the
;; Free Software Foundation. For details, see the file COPYING which
;; you should have received with sawfish, the window manager by John
;; Harper <john@dcs.warwick.ac.uk>.

;; USAGE:
;;
;; To use AquaX, untar the distribution in your Sawfish thmese directory
;;
;; If you wish to use AquaX in it's tarball form, make sure that the
;; filename stem is simply "AquaX", otherwise Sawfish will be unable to
;; access the theme.

;; 00Sep21: v1.0.2 by Kevin D. Knerr, Sr. <ld_barthel@yahoo.com>
;;   "Falling Leaves"


(define theme-name 'AquaX)

;;;;
;;;; user-configurable options
;;;;

(defgroup AquaX "AquaX"
  :group appearance
)

(defcustom aquax:font "-adobe-helvetica-bold-r-normal-*-*-140-*-*-p-*-*"
  "Title font."
  :group (appearance AquaX)
  :type font
)

(defcustom aquax:focused-color "#000000000000"
  "Focused title text color."
  :group (appearance AquaX)
  :type color
)

(defcustom aquax:inactive-color "#6b847fffbfff"
  "Inactive title text color."
  :group (appearance AquaX)
  :type color
)

;; This option lets user choose whether the cursor should change when over
;;    a button. Mac OS X keeps the arrow cursor. A vaulue of "nil" mimics
;;    this behavior in AquaX
;; NOTE: Sawfish now keeps the default cursor for buttons, so in effect,
;;    this option allows the user to choose between current sawfish behavior
;;    and legacy sawmill behavior . . .
(defcustom aquax:button-cursors 'AquaX
  "Set of cursors displayed over buttons/titlebar"
  :group (appearance AquaX)
  :type symbol
  :options (AquaX Sawmill)
)

(defcustom aquax:button-layout 'AquaX
  "Arrangement of buttons on titlebar"
  :group (appearance AquaX)
  :type symbol
  :options (AquaX Amiga FVWM2 KDE MacOS-Platinum MS-Windows TWM WindowMaker)
)

(defcustom aquax:faux-one_window 't
  "Menu button mimics Aqua's one-window button?"
  :group (appearance AquaX)
  :type boolean
)

;;;;
;;;; Define frame classes sticky-cutton & shade-button
;;;;

(defcustom shade-button-keymap (make-keymap)
  "Keymap containing bindings active when the pointer is in the shade button
of a window. (Only mouse-bindings are evaluated in this map.)"
  :group bindings
  :user-level expert
  :type keymap
)

(bind-keys shade-button-keymap "Button1-Off" 'toggle-window-shaded)

(def-frame-class shade-button '(keymap . shade-button-keymap))

(defcustom sticky-button-keymap (make-keymap)
  "Keymap containing bindings active when the pointer is in the sticky button
of a window. (Only mouse-bindings are evaluated in this map.)"
  :group bindings
  :user-level expert
  :type keymap
)

(bind-keys sticky-button-keymap "Button1-Off" 'toggle-window-sticky)

(def-frame-class sticky-button '(keymap . sticky-button-keymap))

;;;;
;;;; Define frame-state dependent components
;;;;

;;;; There are two methods for specifying state-dependent lists:
;;;;   a) a 4 item list consisting of normal, focused, highlighted, & clicked
;;;;      state values, in that order, with nil in place of unspecified valeues
;;;;      (although we can get away with just 2 items if they are normal &
;;;;      focused)
;;;;   b) an alist of cons cells (state . value), which is required if other
;;;;      states, such as inactive-highlighted or inactive-clicked are used)
;;;;      [Thanks to Ian  Bicking <ianb@colorstudy.com> for reminding me
;;;;      that the functions must be comma escaped to be evaluated correctly!]

(define font-colors
  (lambda () `(
    (inactive . ,aquax:inactive-color)
    (focused . ,aquax:focused-color)
  ))
)

;; 1x23
(define title-images `(
  (inactive . ,(make-image "title-inactive.png"))
  (focused . ,(make-image "title-active.png"))
))

;; 6x23
(define title_l-images `(
  (inactive . ,(make-image "title_l-inactive.png"))
  (focused . ,(make-image "title_l-active.png"))
))
(define title_r-images `(
  (inactive . ,(make-image "title_r-inactive.png"))
  (focused . ,(make-image "title_r-active.png"))
))

(define title_ls-images `(
  (inactive . ,(make-image "title_ls-inactive.png"))
  (focused . ,(make-image "title_ls-active.png"))
))
(define title_rs-images `(
  (inactive . ,(make-image "title_rs-inactive.png"))
  (focused . ,(make-image "title_rs-active.png"))
))

;; 19x23
(define close-images `(
  (inactive . ,(make-image "button-inactive.png"))
  (focused . ,(make-image "close-active.png"))
  (highlighted . ,(make-image "close-highlight.png"))
  (inactive-highlighted . ,(make-image "close-inactive-highlight.png"))
  (clicked . ,(make-image "close-clicked.png"))
  (inactive-clicked . ,(make-image "close-inactive-clicked.png"))
))

(define iconify-images `(
  (inactive . ,(make-image "button-inactive.png"))
  (focused . ,(make-image "iconify-active.png"))
  (highlighted . ,(make-image "iconify-highlight.png"))
  (inactive-highlighted . ,(make-image "iconify-inactive-highlight.png"))
  (clicked . ,(make-image "iconify-clicked.png"))
  (inactive-clicked . ,(make-image "iconify-inactive-clicked.png"))
))

(define maximize-images `(
  (inactive . ,(make-image "button-inactive.png"))
  (focused . ,(make-image "maximize-active.png"))
  (highlighted . ,(make-image "maximize-highlight.png"))
  (inactive-highlighted . ,(make-image "maximize-inactive-highlight.png"))
  (clicked . ,(make-image "maximize-clicked.png"))
  (inactive-clicked . ,(make-image "maximize-inactive-clicked.png"))
))

;; menu-images provides a colored menu button whenever window is focused
(define menu-images `(
  (inactive . ,(make-image "button-inactive.png"))
  (focused . ,(make-image "one_window-active.png"))
  (highlighted . ,(make-image "one_window-highlight.png"))
  (inactive-highlighted . ,(make-image "one_window-inactive-highlight.png"))
  (clicked . ,(make-image "one_window-clicked.png"))
  (inactive-clicked . ,(make-image "one_window-inactive-clicked.png"))
))

;; one_window-images provides a look that mimics the Aqua one-window button
(define one_window-images `(
  (inactive . ,(make-image "button-inactive.png"))
  (focused . ,(make-image "one_window-focused-inactive.png"))
  (highlighted . ,(make-image "one_window-highlight.png"))
  (inactive-highlighted . ,(make-image "one_window-inactive-highlight.png"))
  (clicked . ,(make-image "one_window-clicked.png"))
  (inactive-clicked . ,(make-image "one_window-inactive-clicked.png"))
))

;; Shade & sticky images are a special case--we need two sets for each
(define shade-images `(
  (inactive . ,(make-image "button-inactive.png"))
  (focused . ,(make-image "one_window-focused-inactive.png"))
  (highlighted . ,(make-image "shade-highlight.png"))
  (inactive-highlighted . ,(make-image "shade-inactive-highlight.png"))
  (clicked . ,(make-image "shade-clicked.png"))
  (inactive-clicked . ,(make-image "shade-inactive-clicked.png"))
))

(define unshade-images `(
  (inactive . ,(make-image "shade-inactive.png"))
  (focused . ,(make-image "shade-active.png"))
  (highlighted . ,(make-image "shade-highlight.png"))
  (inactive-highlighted . ,(make-image "shade-inactive-highlight.png"))
  (clicked . ,(make-image "shade-clicked.png"))
  (inactive-clicked . ,(make-image "shade-inactive-clicked.png"))
))

(define sticky-images `(
  (inactive . ,(make-image "button-inactive.png"))
  (focused . ,(make-image "one_window-focused-inactive.png"))
  (highlighted . ,(make-image "sticky-highlight.png"))
  (inactive-highlighted . ,(make-image "sticky-inactive-highlight.png"))
  (clicked . ,(make-image "sticky-clicked.png"))
  (inactive-clicked . ,(make-image "sticky-inactive-clicked.png"))
))

(define unsticky-images `(
  (inactive . ,(make-image "sticky-inactive.png"))
  (focused . ,(make-image "sticky-active.png"))
  (highlighted . ,(make-image "sticky-highlight.png"))
  (inactive-highlighted . ,(make-image "sticky-inactive-highlight.png"))
  (clicked . ,(make-image "sticky-clicked.png"))
  (inactive-clicked . ,(make-image "sticky-inactive-clicked.png"))
))

;; Define the paired shade/unshade, sticky/unsticky image sets
(define shade-image-set
  (lambda (w)
    (if (or (window-get w 'shaded) (window-get w 'shade-hover-unshaded))
      unshade-images
      shade-images
    )
  )
)

(define sticky-image-set
  (lambda (w)
    (if (window-get w 'sticky)
      unsticky-images
      sticky-images
    )
  )
)

;; Define the paired one_window/menu image set
(define one_window-image-set
  (lambda ()
    (if aquax:faux-one_window
      one_window-images
      menu-images
    )
  )
)  

;; This type of bottom border does not appear in the MacOS X screenshots.
;; My first attempts at the drop-shadow effect failed, so I settled for
;; this kludge--but it's a kludge consistent with the rest of the theme!

;; 1x7
(define bottom-border-images `(
  (inactive . ,(make-image "border_b-inactive.png"))
  (focused . ,(make-image "border_b-active.png"))
))

;; 6x7
(define bottom-left-images `(
  (inactive . ,(make-image "border_bl-inactive.png"))
  (focused . ,(make-image "border_bl-active.png"))
))

(define bottom-right-images `(
  (inactive . ,(make-image "border_br-inactive.png"))
  (focused . ,(make-image "border_br-active.png"))
))

;; 1x1
(define border-pixels `(
  (inactive . ,(make-image "border_pixel-inactive.png"))
  (focused . ,(make-image "border_pixel-active.png"))
))

;;;;
;;;; We can define frame component groups that will not change here
;;;;

;; border groups
(define normal-border-group `(
  ;; top corners
  ((background . ,title_l-images)
   (top-edge . -23)
   (left-edge . -1)
   (class . top-left-corner))
  ((background . ,title_r-images)
   (top-edge . -23)
   (right-edge . -1)
   (class . top-right-corner))
  ;; top border 
  ((background . ,border-pixels)
   (top-edge . -23)
   (left-edge . 5)
   (right-edge . 5)
   (class . top-border))
  ;; bottom border
  ((background . ,bottom-border-images)
   (bottom-edge . -7)
   (right-edge . 5)
   (left-edge . 5)
   (class . bottom-border))
  ((background . ,bottom-left-images)
   (bottom-edge . -7)
   (left-edge . -1)
   (class . bottom-left-corner))
  ((background . ,bottom-right-images)
   (bottom-edge . -7)
   (right-edge . -1)
   (class . bottom-right-corner))
  ;; side borders 
  ((background . ,border-pixels)
   (top-edge . 0)
   (bottom-edge . 0)
   (left-edge . -1)
   (class . left-border))
  ((background . ,border-pixels)
   (top-edge . 0)
   (bottom-edge . 0)
   (right-edge . -1)
   (class . right-border))
))
(define shaped-border-group `(
  ((background . ,title_ls-images)
   (top-edge . -23)
   (left-edge . -1)
   (class . top-left-corner))
  ((background . ,title_rs-images)
   (top-edge . -23)
   (right-edge . -1)
   (class . top-right-corner))
))
  
;;;;
;;;; Next we define the functions that modify our frame definitions
;;;;

;;;;
;;;; Functions to alter button placement and titlebar dimensions
;;;;

;; Define two theme-depnedent variables to let us calculate button
;;  (and titlebar) edges ((position -1) * width) + offset)
(define button-offset 5)
(define button-width 19)
;; Now, define the function to calculate button positions
(defun button-position (pos)
  "Calculate button positions for frame definitions"
  (+ button-offset (* button-width (- pos 1)))
)  

;; For simplicity, we only setq the buttons needed for each style.
;;   Therefore, to avoid void-value errors, we need to define them
;;   all in advance (although I can think of no circumstance in
;;   which we would *not* define the titlebar positions)

(define close-button-position 0)
(define iconify-button-position 0)
(define maximize-button-position 0)
(define one_window-button-position 0)
(define shade-button-position 0)
(define sticky-button-position 0)
(define left-title-position 0)
(define right-title-position 0)

;; First a function to place our buttons
(define set-button-placement
  (lambda ()
    (case aquax:button-layout
      ((AquaX)
        (setq close-button-position `(left-edge . ,(button-position 1)))
        (setq iconify-button-position `(left-edge . ,(button-position 2)))
        (setq maximize-button-position `(left-edge . ,(button-position 3)))
        (setq left-title-position `(left-edge . ,(button-position 4)))
        (setq right-title-position `(right-edge . ,(button-position 2)))
        (setq one_window-button-position `(right-edge . ,(button-position 1)))
      )
      ((Amiga)
        (setq close-button-position `(left-edge . ,(button-position 1)))
        (setq left-title-position `(left-edge . ,(button-position 2)))
        (setq right-title-position `(right-edge . ,(button-position 3)))
        (setq iconify-button-position `(right-edge . ,(button-position 2)))
        (setq maximize-button-position `(right-edge . ,(button-position 1)))
      )
      ((FVWM2)
        (setq one_window-button-position `(left-edge . ,(button-position 1)))
        (setq sticky-button-position `(left-edge . ,(button-position 2)))
        (setq left-title-position `(left-edge . ,(button-position 3)))
        (setq right-title-position `(right-edge . ,(button-position 4)))
        (setq shade-button-position `(right-edge . ,(button-position 3)))
        (setq iconify-button-position `(right-edge . ,(button-position 2)))
        (setq maximize-button-position `(right-edge . ,(button-position 1)))
      )
      ((KDE)
        (setq one_window-button-position `(left-edge . ,(button-position 1)))
        (setq sticky-button-position `(left-edge . ,(button-position 2)))
        (setq left-title-position `(left-edge . ,(button-position 3)))
        (setq right-title-position `(right-edge . ,(button-position 4)))
        (setq iconify-button-position `(right-edge . ,(button-position 3)))
        (setq maximize-button-position `(right-edge . ,(button-position 2)))
        (setq close-button-position `(right-edge . ,(button-position 1)))
      )
      ((MacOS-Platinum)
        (setq close-button-position `(left-edge . ,(button-position 1)))
        (setq left-title-position `(left-edge . ,(button-position 2)))
        (setq right-title-position `(right-edge . ,(button-position 3)))
        (setq maximize-button-position `(right-edge . ,(button-position 2)))
        (setq shade-button-position `(right-edge . ,(button-position 1)))
      )
      ((MS-Windows)
        (setq one_window-button-position `(left-edge . ,(button-position 1)))
        (setq left-title-position `(left-edge . ,(button-position 2)))
        (setq right-title-position `(right-edge . ,(button-position 4)))
        (setq iconify-button-position `(right-edge . ,(button-position 3)))
        (setq maximize-button-position `(right-edge . ,(button-position 2)))
        (setq close-button-position `(right-edge . ,(button-position 1)))
      )
      ((TWM)
        (setq one_window-button-position `(left-edge . ,(button-position 1)))
        (setq left-title-position `(left-edge . ,(button-position 2)))
        (setq right-title-position `(right-edge . ,(button-position 1)))
      )
      ((WindowMaker)
        (setq iconify-button-position `(left-edge . ,(button-position 1)))
        (setq left-title-position `(left-edge . ,(button-position 2)))
        (setq right-title-position `(right-edge . ,(button-position 2)))
        (setq close-button-position `(right-edge . ,(button-position 1)))
      )
      ;; We duplicate AquaX for the fall-through case
      ;;   We should ***NEVER*** encounter this!!
      (t
        (setq close-button-position `(left-edge . ,(button-position 1)))
        (setq iconify-button-position `(left-edge . ,(button-position 2)))
        (setq maximize-button-position `(left-edge . ,(button-position 3)))
        (setq left-title-position `(left-edge . ,(button-position 4)))
        (setq right-title-position `(right-edge . ,(button-position 2)))
        (setq one_window-button-position `(right-edge . ,(button-position 1)))
      )
    )
  )
)

;;;;
;;;; Functions to modify the cursor associated with the titlebar & buttons
;;;;

;;; 000919: Define the frame-part cursor variables
(define close-button-cursor nil)
(define iconify-button-cursor nil)
(define maximize-button-cursor nil)
(define one_window-button-cursor nil)
(define shade-button-cursor nil)
(define sticky-button-cursor nil)
(define titlebar-cursor nil)

(define set-button-cursors
  (lambda ()
    (case aquax:button-cursors
      ((AquaX)
        (setq close-button-cursor `(cursor . left_ptr))
        (setq iconify-button-cursor `(cursor . left_ptr))
        (setq maximize-button-cursor `(cursor . left_ptr))
        (setq one_window-button-cursor `(cursor . left_ptr))
        (setq shade-button-cursor `(cursor . left_ptr))
        (setq sticky-button-cursor `(cursor . left_ptr))
        (setq titlebar-cursor `(cursor . left_ptr))
      )
      ;; This option recreates the old default sawmill behavior
      ((Sawmill)
        (setq close-button-cursor `(cursor . dotbox))
        (setq iconify-button-cursor `(cursor . sb_down_arrow))
        (setq maximize-button-cursor `(cursor . sb_v_double_arrow))
        (setq one_window-button-cursor `(cursor . circle))
        (setq shade-button-cursor `(cursor . top_tee))
        (setq sticky-button-cursor `(cursor . diamond_cross))
        (setq titlebar-cursor `(cursor . hand2))
      )
      ;; We duplicate the sawfish default for the fall-through case
      ;;   We should ***NEVER*** encounter this!!
      (t
        (setq close-button-cursor `(cursor . left_ptr))
        (setq iconify-button-cursor `(cursor . left_ptr))
        (setq maximize-button-cursor `(cursor . left_ptr))
        (setq one_window-button-cursor `(cursor . left_ptr))
        (setq shade-button-cursor `(cursor . left_ptr))
        (setq sticky-button-cursor `(cursor . left_ptr))
        (setq titlebar-cursor `(cursor . hand2))
      )
    )  
  )
)

;;;;
;;;; Combine the components into groups
;;;;

(define close-button-group nil)
(define iconify-button-group nil)
(define maximize-button-group nil)
(define one_window-button-group nil)
(define shade-button-group nil)
(define sticky-button-group nil)
(define normal-titlebar nil)
(define transient-titlebar nil)


(define set-frame-groups
  (lambda ()
    ;; button groups
    (setq close-button-group `(
      ((background . ,close-images)
       (top-edge . -23)
       ,close-button-position
       ,close-button-cursor
       (class . close-button))
    ))
    (setq iconify-button-group `(
      ((background . ,iconify-images)
       (top-edge . -23)
       ,iconify-button-position
       ,iconify-button-cursor
       (class . iconify-button))
    ))
    (setq maximize-button-group `(
      ((background . ,maximize-images)
       (top-edge . -23)
       ,maximize-button-position
       ,maximize-button-cursor
       (class . maximize-button))
    ))
    ;; We'll use the "one_window" button for our menus.
    (setq one_window-button-group `(
      ((background . ,one_window-image-set)
       (top-edge . -23)
       ,one_window-button-position
       ,one_window-button-cursor
       (class . menu-button))
    ))
    
    ;; The shade & sticky buttons don't exist in Aqua
    ;;   We include them here to imitate other X window managers
    (setq shade-button-group `(
      ((background . ,shade-image-set)
       (top-edge . -23)
       ,shade-button-position
       ,shade-button-cursor
       (class . shade-button))
    ))
    (setq sticky-button-group `(
      ;((background . ,sticky-images)
      ((background . ,sticky-image-set)
       (top-edge . -23)
       ,sticky-button-position
       ,sticky-button-cursor
       (class . sticky-button))
    ))
    
    ;; title bars
    (setq normal-titlebar `(
      ((y-justify . center)
       (x-justify . center)
       (text . ,window-name)
       (font . ,aquax:font)
       (foreground . ,font-colors)
       (background . ,title-images)
       (top-edge . -23)
       ,left-title-position
       ,right-title-position
       ,titlebar-cursor
       (class . title))
    ))
    (setq transient-titlebar `(
      ((y-justify . center)
       (x-justify . center)
       (text . ,window-name)
       (font . ,aquax:font)
       (foreground . ,font-colors)
       (background . ,title-images)
       (top-edge . -23)
       (right-edge . ,(button-position 1))
       (left-edge . ,(button-position 1))
       ,titlebar-cursor
       (class . title))
    ))
  
    ;; Choose which buttons to display based on our button placement option
    (define buttons-group nil)

    (case aquax:button-layout
      ((AquaX)
        (setq buttons-group (append
          close-button-group
          iconify-button-group
          maximize-button-group
          one_window-button-group
        )) 
      )
      ((Amiga)
        (setq buttons-group (append
          close-button-group
          iconify-button-group
          maximize-button-group
        )) 
      )
      ((FVWM2)
        (setq buttons-group (append
          close-button-group
          iconify-button-group
          maximize-button-group
          one_window-button-group
          shade-button-group
  	  sticky-button-group
        )) 
      )
      ((KDE)
        (setq buttons-group (append
          close-button-group
          iconify-button-group
          maximize-button-group
          one_window-button-group
  	  sticky-button-group
        )) 
      )
      ((MacOS-Platinum)
        (setq buttons-group (append
          close-button-group
          maximize-button-group
          shade-button-group
        )) 
      )
      ((MS-Windows)
        (setq buttons-group (append
          close-button-group
          iconify-button-group
          maximize-button-group
          one_window-button-group
        )) 
      )
      ((TWM)
        (setq buttons-group (append
          one_window-button-group
        )) 
      )
      ((WindowMaker)
        (setq buttons-group (append
          close-button-group
          iconify-button-group
        )) 
      )
      ;; We include all button groups for the fall-through case
      ;;   We should ***NEVER*** encounter this!!
      (t
        (setq buttons-group (append
          close-button-group
          iconify-button-group
          maximize-button-group
          one_window-button-group
          shade-button-group
  	  sticky-button-group
        )) 
      )
    )
  )
)

;;;;
;;;; Finally, we create our full frame definitions
;;;;

(define normal-frame nil)
(define shaped-frame nil)
(define transient-frame nil)
(define shaped-transient-frame nil)
;(define iconic-frame nil)
;(define dock-frame nil)

(define create-frames
  (lambda ()
    ;; First, call any functions that set values we need to create our frames
    (set-button-placement)
    (set-button-cursors)
    (set-frame-groups)
  
    ;; Now we create the various frames required for our theme
    (setq normal-frame (append
      normal-titlebar
      buttons-group
      normal-border-group
    ))
    
    (setq shaped-frame (append
      normal-titlebar
      buttons-group
      shaped-border-group
    ))
    
    (setq transient-frame (append
      transient-titlebar
      normal-border-group
    ))
    
    (setq shaped-transient-frame (append
      transient-titlebar
      shaped-border-group
    ))
  )
)  

(create-frames)

;; At last! We create the actual theme
(add-frame-style theme-name
  (lambda (w type)
    (case type
      ((default)              normal-frame)
      ((shaped)               shaped-frame)
      ((transient)            transient-frame)
      ((shaped-transient)     shaped-transient-frame)
;      ((icon)			iconic-frame)
;      ((dock)			dock-frame)
      ((unframed)             nil-frame)
    )
  )
)


;;;;
;;;; Define some functions to handle frame updates correctly
;;;;

(define (reframe-one w)
  (if (eq (window-get w 'current-frame-style) theme-name)
    (rebuild-frame w)
  )
)

(define reframe-all
  (lambda ()
    (create-frames)
    (reframe-windows-with-style 'AquaX)
  )
) 

;;;;
;;;; Set conditions for calling the frame update functions
;;;;

(call-after-property-changed 'WM_NAME reframe-one)
(call-after-state-changed '(sticky) reframe-one)
(call-after-state-changed '(shaded) reframe-one)

;;;;
;;;; Define the after-set properties of our custom variables
;;;;

(custom-set-property 'aquax:font ':after-set reframe-all)
(custom-set-property 'aquax:focused-color ':after-set reframe-all)
(custom-set-property 'aquax:inactive-color ':after-set reframe-all)
(custom-set-property 'aquax:button-cursors ':after-set reframe-all)
(custom-set-property 'aquax:button-layout ':after-set reframe-all)
(custom-set-property 'aquax:faux-one_window ':after-set reframe-all)

