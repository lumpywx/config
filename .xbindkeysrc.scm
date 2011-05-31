;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Start of xbindkeys configuration ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This configuration is guile based.
;;
;; This configuration allow combo keys.
;; ie Control+z Control+e -> xterm
;;    Control+z z         -> rxvt
;;    Control+z Control+g -> quit second mode
;;
;; It also allow to add or remove a key on the fly!


(define (first-binding)
  (xbindkey-function '(Control semicolon) prefix-key))

(define (reset-first-binding)
  (ungrab-all-keys)
  (remove-all-keys)
  (first-binding)
  (grab-all-keys))

(define (prefix-key)
  (ungrab-all-keys)
  (remove-all-keys)
  (xbindkey-function 'p
		     (lambda ()
		       (run-command "wmctrl -xa XTerm || xterm -e screen")
		       (reset-first-binding)))
  (xbindkey-function 'Return
		     (lambda ()
		       (run-command "wmctrl -xa URxvt || ~/.bin/rxvt -e screen")
		       (reset-first-binding)))
  (xbindkey-function 'e
		     (lambda ()
		       (run-command "wmctrl -xa Emacs || emacsclient -c -n")
		       (reset-first-binding)))
  (xbindkey-function 'q
		     (lambda ()
		       (run-command "wmctrl -xa Firefox || firefox")
		       (reset-first-binding)))
  (xbindkey-function 'w
		     (lambda ()
		       (run-command "wmctrl -xa Thunar || thunar")
		       (reset-first-binding)))
  (xbindkey-function 'l
		     (lambda ()
		       (run-command "slock")
		       (reset-first-binding)))
  (xbindkey-function '(control g) reset-first-binding)
  (debug)
  (grab-all-keys))

(first-binding)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; End of xbindkeys configuration ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
