#!/bin/sh

xrandr -s 1280x960
#setxkbmap -option ctrl:swapcaps
#input method
export LC_CTYPE='zh_CN.utf8'
export XMODIFIERS="@im=yong"
export GTK_IM_MODULE="xim"
export QT_IM_MODULE="xim"

exec sawfish;
