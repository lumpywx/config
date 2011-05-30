#.bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
#startx
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
	startx > /dev/null 2>&1 &
fi
