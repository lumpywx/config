;; This configuration is guile based.

(define (first-binding)
  (xbindkey-function '(Control semicolon) prefix-key)
  (xbindkey '(Mod4 Return) "~/.bin/rxvt")
  (xbindkey '(Mod4 i) "xterm")
  (xbindkey '(Control Mod4 l) "slock")
  (xbindkey '(Print) "scrot -u -e 'mv $f ~/picture/shot/'")
  (xbindkey '(Mod4 Print) "scrot -s -e 'mv $f ~/picture/shot/'")
  (xbindkey '(Mod4 Left) "mocp -G")
  (xbindkey '(Mod4 Right) "mocp -f")
  (xbindkey '(Mod4 Up) "~/.bin/moc")
  (xbindkey '(Mod4 Down) "mocp -t n")
  )

;;--------------------jump-or-exec--------------------
(define (reset-first-binding)
  (ungrab-all-keys)
  (remove-all-keys)
  (first-binding)
  (grab-all-keys))

(define (prefix-key)
  (ungrab-all-keys)
  (remove-all-keys)
  (xbindkey-function 'u
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
  (xbindkey-function '(control g) reset-first-binding)
  (debug)
  (grab-all-keys))
(first-binding)
;;--------------------jump-or-exec-end--------------------
