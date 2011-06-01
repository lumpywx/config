;; Aquarational/theme.jl

;; Copyright (C) 2000 Pedro Lopes (paol@teleweb.pt)

;; Adapted from the "Aquarational" KDE theme, by Juliano Soares dos Santos
;; (juliano@eps.ufsc.br)
;; With contributions from David Harris (dbarclay10@yahoo.ca)

;; This theme is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; It is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with sawmill; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.


;; configuration options

(defgroup Aquarational "Aquarational Theme"
  :group appearance)

(defcustom op:title-font 
  (get-font "-b&h-lucidatypewriter-bold-r-normal-*-*-120-*-*-m-*-iso8859-1")
  "Font for window titles."
  :group (appearance Aquarational)
  :type font)

(defcustom op:button-layout 'default
  "Titlebar buttons layout style."
  :group (appearance Aquarational)
  :type symbol
  :options (default KDE MacOS-Platinum MS-Windows WindowMaker HacKDE))

(defcustom op:button-bevel 'focused-windows
  "Beveled titlebar buttons."
  :group (appearance Aquarational)
  :type symbol
  :options (all-windows focused-windows on-mouseover never))

(defcustom op:frame-bevel 't
  "Beveled window frame inside."
  :group (appearance Aquarational)
  :type boolean)

(defcustom op:use-icons 'nil
  "Use application icon for titlebar menu button."
  :group (appearance Aquarational)
  :type boolean)

(defcustom op:texture-percent 100
  "Percentage of free title-bar space on which to apply the rivet texture."
  :group (appearance Aquarational)
  :type number
  :range (0 . 100))

(defcustom op:texture-keepaway-width 0
  "Width (columns of rivets) to keep clean of textures surrounding title bar text."
  :group (appearance Aquarational)
  :type number
  :range (0 . 200))


;; new frame part classes

(def-frame-class sticky-button ()
  (bind-keys sticky-button-keymap "Button1-Off" 'toggle-window-sticky))

(def-frame-class shade-button ()
  (bind-keys shade-button-keymap "Button1-Off" 'toggle-window-shaded))


;;

(let*
  ( ;; *** fonts & colors ********************************************

    (title-font	(lambda () op:title-font))

    (bg-color	(get-color "#c9c9c9"))
    (dark-color	(get-color "#8b8988"))
    
    (text-color	(list (get-color "#817F7F") (get-color "#363434")))

    ;; *** textures **************************************************

    ;; button backgrounds (16x16)
    (bg-btn-all-bev	(list	(make-image "btn_bg_up.png")
				nil
				nil
				(make-image "btn_bg_down3.png")))

    (bg-btn-focus-bev	(list	bg-color
				(make-image "btn_bg_up.png")
				nil
				(make-image "btn_bg_down3.png")))

    (bg-btn-hover-bev	(list	bg-color
				nil
				(make-image "btn_bg_up.png")
				(make-image "btn_bg_down3.png")))

    (bg-btn-no-bev	(list	bg-color
				nil
				nil
				(make-image "btn_bg_down3.png")))

    (bg-btn		(lambda ()
			  (cond
			    ((eq op:button-bevel 'all-windows)
			      bg-btn-all-bev)
			    ((eq op:button-bevel 'focused-windows)
			      bg-btn-focus-bev)
			    ((eq op:button-bevel 'on-mouseover)
			      bg-btn-hover-bev)
			    (t
			      bg-btn-no-bev))))

    (default-icon	(make-image "default_icon.png"))
    (bg-btn-icon	(lambda (w)
			  (let ((icon (window-icon-image w)))
			    (if (eq icon nil) default-icon icon))))

    ;; button foregrounds (12x12)
    (fg-btn-menu	(list 	(make-image "btn_fg_menu_nofocus.png")
				(make-image "btn_fg_menu_focus.png")
	    			nil
				nil))

    (fg-btn-close	(list 	(make-image "btn_fg_close_nofocus.png")
				(make-image "btn_fg_close_focus.png")
				nil
	    			nil))

    (fg-btn-min		(list 	(make-image "btn_fg_min_nofocus.png")
				(make-image "btn_fg_min_focus.png")
				nil
	    			nil))

    (fg-btn-max		(list 	(make-image "btn_fg_max_nofocus.png")
				(make-image "btn_fg_max_focus.png")
				nil
	    			nil))
    (fg-btn-unmax	(list 	(make-image "btn_fg_unmax_nofocus.png")
				(make-image "btn_fg_unmax_focus.png")
				nil
	    			nil))
    (fg-btn-max-unmax	(lambda (w)
			  (if (window-maximized-p w)
			      fg-btn-unmax
			    fg-btn-max)))

    (fg-btn-shade	(list 	(make-image "btn_fg_shade_nofocus.png")
				(make-image "btn_fg_shade_focus.png")
				nil
	    			nil))
    (fg-btn-unshade	(list 	(make-image "btn_fg_unshade_nofocus.png")
				(make-image "btn_fg_unshade_focus.png")
				nil
	    			nil))
    (fg-btn-shd-unshd	(lambda (w)
			  (if (window-get w 'shaded)
			      fg-btn-unshade
			    fg-btn-shade)))

    (fg-btn-stick	(list 	(make-image "btn_fg_stick2_nofocus.png")
				(make-image "btn_fg_stick2_focus.png")
				nil
	    			nil))
    (fg-btn-unstick	(list 	(make-image "btn_fg_unstick2_nofocus.png")
				(make-image "btn_fg_unstick2_focus.png")
				nil
	    			nil))
    (fg-btn-stk-unstk	(lambda (w)
			  (if (window-get w 'sticky)
			      fg-btn-unstick
			    fg-btn-stick)))

    ;; titlebar
    (textures-title
      (let ((tex-img (make-image "title_texture_focus.png")))
        (image-put tex-img 'tiled t)
        (list bg-color tex-img)))

    ;; edges (4 pixel wide)
    (textures-top-edge		(make-image "top.png"))

    (textures-bottom-bev	(make-image "bottom_bevel.png"))
    (textures-bottom-nobev	(make-image "bottom.png"))
    (textures-bottom-edge	(lambda ()
				  (if op:frame-bevel
				      textures-bottom-bev
				    textures-bottom-nobev)))
    
    (textures-left-bev		(make-image "left_bevel.png"))
    (textures-left-nobev	(make-image "left.png"))
    (textures-left-edge		(lambda ()
				  (if op:frame-bevel
				      textures-left-bev
				    textures-left-nobev)))

    (textures-right-bev		(make-image "right_bevel.png"))
    (textures-right-nobev	(make-image "right.png"))
    (textures-right-edge	(lambda ()
				  (if op:frame-bevel
				      textures-right-bev
				    textures-right-nobev)))

    ;; top corners (16x22, 4 pixel wide)
    (textures-tl-corner		(make-image "top_left.png"))

    (textures-tr-corner		(make-image "top_right.png"))

    ;; bottom corners (16x16, 4 pixel wide)
    (textures-bl-bev		(make-image "bottom_left_bevel.png"))
    (textures-bl-nobev		(make-image "bottom_left.png"))
    (textures-bl-corner		(lambda ()
				  (if op:frame-bevel
				      textures-bl-bev
				    textures-bl-nobev)))

    (textures-br-bev		(make-image "bottom_right_bevel.png"))
    (textures-br-nobev		(make-image "bottom_right.png"))
    (textures-br-corner		(lambda ()
				  (if op:frame-bevel
				      textures-br-bev
				    textures-br-nobev)))

    ;; edges for windowshade titlebar
    (textures-title-left	(make-image "title_left.png"))

    (textures-title-right	(make-image "title_right.png"))

    (textures-title-bottom	(make-image "bottom.png"))


    ;; *** dimensions ************************************************

    (tex-norm-left	nil)
    (tex-norm-right	nil)
    (tex-trans-left	nil)
    (tex-trans-right	nil)

    (texture-pos-left
      (lambda (w)
	(if (or (eq (window-type w) 'transient)
		(eq (window-type w) 'shaped-transient))
	    (1+ tex-trans-left)
	  (1+ tex-norm-left))))
    
    (texture-pos-right
      (lambda (w)
	(if (or (eq (window-type w) 'transient)
		(eq (window-type w) 'shaped-transient))
	    tex-trans-right
	  tex-norm-right)))

    (texture-width
      (lambda (w)
	(let* ((title-width   (+ (text-width (window-name w) op:title-font)
				 6))
	       ;; free space after drawing buttons and window title
	       (freespace     (- (car (window-dimensions w))
				 (texture-pos-left w)
				 (texture-pos-right w)
				 title-width))
	       ;; space to occupy with texture
	       (texture-space (quotient (* (- freespace
					      (* op:texture-keepaway-width 12))
					   op:texture-percent)
					100)))
	  (if (< texture-space 12)
	      ;; no extra room for texture
	      0
	    ;; divide by 2 but chop at a multiple of 6
	    (* (quotient texture-space 12) 6)))))


    ;; *** buttons ***************************************************

    (close-button
      `((class		. close-button)
	(background	. ,bg-btn)
	(top-edge	. -19)
	(foreground	. ,fg-btn-close)
	(x-justify	. 2)
	(y-justify	. 2)
	(removable	. t)))
    (menu-button-icon
      `((class		. menu-button)
	(background	. ,bg-btn-icon)
	(width		. 16)
	(height		. 16)
	(top-edge	. -19)
	(removable	. t)))
    (menu-button-noicon
      `((class		. menu-button)
	(background	. ,bg-btn)
	(top-edge	. -19)
	(foreground	. ,fg-btn-menu)
	(x-justify	. 2)
	(y-justify	. 2)
	(removable	. t)))
    (min-button
      `((class		. iconify-button)
	(background	. ,bg-btn)
	(top-edge	. -19)
	(foreground	. ,fg-btn-min)
	(x-justify	. 2)
	(y-justify	. 2)
	(removable	. t)))
    (max-button
      `((class		. maximize-button)
	(background	. ,bg-btn)
	(top-edge	. -19)
	(foreground	. ,fg-btn-max-unmax)
	(x-justify	. 2)
	(y-justify	. 2)
	(removable	. t)))
    (shade-button
      `((class		. shade-button)
	(background	. ,bg-btn)
	(top-edge	. -19)
	(foreground	. ,fg-btn-shd-unshd)
	(x-justify	. 2)
	(y-justify	. 2)
	(removable	. t)))
    (sticky-button
      `((class		. sticky-button)
	(background	. ,bg-btn)
	(top-edge	. -19)
	(foreground	. ,fg-btn-stk-unstk)
	(x-justify	. 2)
	(y-justify	. 2)
	(removable	. t)))


    ;; *** normal frame **********************************************

    (normal-frame `(
	;; top border
	((class		. top-border)
	 (background	. ,textures-top-edge)
         (left-edge	. 12)
         (right-edge	. 12)
         (top-edge	. -23)
         (height	. 4))
	;; bottom border
	((class		. bottom-border)
	 (background	. ,textures-bottom-edge)
         (left-edge	. 12)
         (right-edge	. 12)
         (bottom-edge	. -4)
         (height	. 4))
	;; right border
	((class		. right-border)
	 (background	. ,textures-right-edge)
         (right-edge	. -4)
         (width		. 4)
         (top-edge	. -1)
         (bottom-edge	. 12))
	;; left border
	((class		. left-border)
	 (background	. ,textures-left-edge)
         (left-edge	. -4)
         (width		. 4)
         (top-edge	. -1)
         (bottom-edge	. 12))
	;; top-left corner
	((class		. top-left-corner)
	 (background	. ,textures-tl-corner)
         (left-edge	. -4)
         (width		. 16)
         (top-edge	. -23)
         (height	. 22))
	;; top-right corner
	((class		. top-right-corner)
	 (background	. ,textures-tr-corner)
         (right-edge	. -4)
         (width		. 16)
         (top-edge	. -23)
         (height	. 22))
	;; bottom-left corner
	((class		. bottom-left-corner)
	 (background	. ,textures-bl-corner)
         (left-edge	. -4)
         (width		. 16)
         (bottom-edge	. -4)
         (height	. 16))
	;; bottom-right corner
	((class		. bottom-right-corner)
	 (background	. ,textures-br-corner)
         (right-edge	. -4)
         (width		. 16)
         (bottom-edge	. -4)
         (height	. 16))
	;; title bar
	((class		. title)		; background
	 (background	. ,bg-color)
	 (left-edge	. 0)
	 (right-edge	. 0)
	 (top-edge	. -20)
	 (height	. 20))
	((class		. title)		; left bg texture
	 (background	. ,textures-title)
	 (left-edge	. ,texture-pos-left)
	 (width		. ,texture-width)
	 (top-edge	. -17)
	 (height	. 13))
	((class		. title)		; right bg texture
	 (background	. ,textures-title)
	 (right-edge	. ,texture-pos-right)
	 (width		. ,texture-width)
	 (top-edge	. -17)
	 (height	. 13))
	((class		. title)		; title
	 (foreground	. ,text-color)
	 (background	. ,bg-color)
	 (font		. ,title-font)
	 (text		. ,window-name)
	 (x-justify	. center)
	 (y-justify	. center)
	 (left-edge	. ,(lambda (w) (+ (texture-pos-left w) (texture-width w))))
	 (right-edge	. ,(lambda (w) (+ (texture-pos-right w) (texture-width w))))
	 (top-edge	. -18)
	 (height	. 16))
	((class		. title)		; lower bevel
	 (background	. ,dark-color)
	 (left-edge	. 0)
	 (right-edge	. 0)
	 (top-edge	. -1)
	 (height	. 1))))


    ;; *** shaped & windowshade frame ********************************

    (shaped-frame `(
	;; title bar
	((class		. title)		; background
	 (background	. ,bg-color)
	 (left-edge	. 0)
	 (right-edge	. 0)
	 (top-edge	. -19)
	 (height	. 16))
	((class		. title)		; left bg texture
	 (background	. ,textures-title)
	 (left-edge	. ,texture-pos-left)
	 (width		. ,texture-width)
	 (top-edge	. -17)
	 (height	. 13))
	((class		. title)		; right bg texture
	 (background	. ,textures-title)
	 (right-edge	. ,texture-pos-right)
	 (width		. ,texture-width)
	 (top-edge	. -17)
	 (height	. 13))
	((class		. title)		; title
	 (foreground	. ,text-color)
	 (background	. ,bg-color)
	 (font		. ,title-font)
	 (text		. ,window-name)
	 (x-justify	. center)
	 (y-justify	. center)
	 (left-edge	. ,(lambda (w) (+ (texture-pos-left w) (texture-width w))))
	 (right-edge	. ,(lambda (w) (+ (texture-pos-right w) (texture-width w))))
	 (top-edge	. -18)
	 (height	. 16))
	((class		. title)		; top border
	 (background	. ,textures-top-edge)
	 (left-edge	. 0)
	 (right-edge	. 0)
	 (top-edge	. -23)
	 (height	. 4))
	((class		. title)		; bottom border
	 (background	. ,textures-title-bottom)
	 (left-edge	. 0)
	 (right-edge	. 0)
	 (top-edge	. -3)
	 (height	. 4))
	((class		. title)		; right border
	 (background	. ,textures-title-right)
	 (right-edge	. -4)
	 (width		. 4)
	 (top-edge	. -23)
	 (height	. 24))
	((class		. title)		; left border
	 (background	. ,textures-title-left)
	 (left-edge	. -4)
	 (width		. 4)
	 (top-edge	. -23)
	 (height	. 24))))


    ;; *** function to build the complete frames *********************

    (menu-button		nil)

    (normal-frame-full		nil)
    (shaped-frame-full		nil)
    (trans-frame-full		nil)
    (shaped-trans-frame-full	nil)

    (create-frames
      (lambda ()
	(let* (	(menu-button
		  (if op:use-icons menu-button-icon menu-button-noicon))
	
		(normal-buttons
		  (case op:button-layout
		    ((KDE)
		      (setq tex-norm-left  39)
		      (setq tex-norm-right 59)
		      (list
			(cons '(left-edge  .  2) menu-button)
			(cons '(left-edge  . 20) sticky-button)
			(cons '(right-edge .  2) close-button)
			(cons '(right-edge . 22) max-button)
			(cons '(right-edge . 40) min-button)))
		    ((HacKDE)
		      (setq tex-norm-left  21)
		      (setq tex-norm-right 59)
		      (list
			(cons '(left-edge  . 2) sticky-button)
			(cons '(right-edge .  2) close-button)
			(cons '(right-edge . 22) max-button)
			(cons '(right-edge . 40) min-button)))
		    ((MacOS-Platinum)
		      (setq tex-norm-left  21)
		      (setq tex-norm-right 39)
		      (list
			(cons '(left-edge  .  2) close-button)
			(cons '(right-edge .  2) shade-button)
			(cons '(right-edge . 20) max-button)))
		    ((MS-Windows)
		      (setq tex-norm-left  21)
		      (setq tex-norm-right 59)
		      (list
			(cons '(left-edge  .  2) menu-button)
			(cons '(right-edge .  2) close-button)
			(cons '(right-edge . 22) max-button)
			(cons '(right-edge . 40) min-button)))
		    ((WindowMaker)
		      (setq tex-norm-left  21)
		      (setq tex-norm-right 21)
		      (list
			(cons '(left-edge  .  2) min-button)
			(cons '(right-edge .  2) close-button)))
		    (t
		      (setq tex-norm-left  21)
		      (setq tex-norm-right 39)
		      (list
			(cons '(left-edge  .  2) close-button)
			(cons '(right-edge .  2) max-button)
			(cons '(right-edge . 20) min-button)))))

		(trans-buttons
		  (case op:button-layout 
		    ((KDE MS-Windows HacKDE)
		      (setq tex-trans-left  21)
		      (setq tex-trans-right 21)
		      (list
			(cons '(left-edge  .  2) menu-button)
			(cons '(right-edge .  2) close-button)))
		    ((WindowMaker)
		      (setq tex-trans-left   1)
		      (setq tex-trans-right 21)
		      (list (cons '(right-edge . 2) close-button)))
		    (t
		      (setq tex-trans-left  22)
		      (setq tex-trans-right  2)
		      (list (cons '(left-edge . 2) close-button)))))
	      )

	(setq normal-frame-full
	  (append normal-frame normal-buttons))
	(setq shaped-frame-full
	  (append shaped-frame normal-buttons))
	(setq trans-frame-full
	  (append normal-frame trans-buttons))
	(setq shaped-trans-frame-full
	  (append shaped-frame trans-buttons)))))

    ;; *** redrawing functions ***************************************

    (redraw-one-frame
      (lambda (w)
	(if (eq (window-get w 'current-frame-style) 'Aquarational)
	    (rebuild-frame w))))

    (redraw-all-frames
      (lambda ()
	(rebuild-frames-with-style 'Aquarational)))

    (recreate-all-frames
      (lambda ()
        (create-frames)
      	(reframe-windows-with-style 'Aquarational)))

  )


  ;; create the full frames

  (create-frames)
  
  ;; frame style function now returns nil for unknow styles

  (add-frame-style 'Aquarational
    (lambda (w type)
      (case type
	((default)		normal-frame-full)
	((transient)		trans-frame-full)
	((shaped)		shaped-frame-full)
	((shaped-transient)	shaped-trans-frame-full))))

  ;; make sure frames are redrawn/recreated when necessary

  (call-after-property-changed 'WM_NAME		redraw-one-frame)
  ;; redraw on WM_HINTS to catch icon changes (at least it works for gnomecc...)
  (call-after-property-changed 'WM_HINTS	redraw-one-frame)
  (call-after-state-changed '(sticky)		redraw-one-frame)

  (custom-set-property 'op:title-font ':after-set	redraw-all-frames)
  (custom-set-property 'op:button-bevel ':after-set	redraw-all-frames)
  (custom-set-property 'op:frame-bevel ':after-set	redraw-all-frames)
  (custom-set-property 'op:texture-percent ':after-set	redraw-all-frames)
  (custom-set-property 'op:texture-keepaway-width ':after-set	redraw-all-frames)

  (custom-set-property 'op:button-layout ':after-set	recreate-all-frames)
  (custom-set-property 'op:use-icons ':after-set	recreate-all-frames)
)
