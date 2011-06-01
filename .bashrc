#umask
umask 077

#completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

#history
shopt -s histappend
PROMPT_COMMAND='history -a'

#path
PATH=/home/lumpy/.bin:/usr/local/arm/4.3.2/bin:$PATH

#alias
alias ..="cd .."
alias dt='demsg|tail -n 20'
alias du='du -sh'
alias chmod='chmod -v'
alias chown='chown -v'
alias ee='emacsclient -t "$@" -a ""'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ex='emacsclient -nc "$@" -a ""'
alias et='emacsclient -t "$@" -a ""'

#screen
case $TERM in
    xterm*)
        # Set xterm's title
        TITLEBAR='\[\e]0;\u@\h:\w\a\]'
        PS1="${TITLEBAR}${PS1}"
		;;
    rxvt*)
        # Set urxvt's title
        TITLEBAR='\[\e]0;\u@\h:\w\a\]'
        PS1="${TITLEBAR}${PS1}"
        ;;
    screen*)
        # Use path as title
        PATHTITLE='\[\ek\W\e\\\]'
        # Use program name as title
        PROGRAMTITLE='\[\ek\e\\\]'
        PS1="${PROGRAMTITLE}${PATHTITLE}${PS1}"
        ;;
    *)
        ;;
esac
