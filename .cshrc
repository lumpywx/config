# Handle history
set history = 200
set histdup = erase
##
umask 022
set -f path = ( /home/lumpy/.bin $path )
set -f path = ( /usr/local/arm/4.3.2/bin $path)

set autolist
set nobeep

alias ls ls --color=auto -FCh
alias grep grep --color=auto
alias ll ls -l

alias mv mv -iv
alias rm rm -iv
alias rmdir rmdir -v
alias cp cp -iv
alias ln ln -v
alias df df -h
alias du du -h

alias chmod chmod -v
alias chown chown -v

alias feh feh -F
alias sc screen
alias cl clear
