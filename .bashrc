# If not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# history length
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
#GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1
PROMPT_DIRTRIM=3
seed=$(hostname -f | md5sum | tr -dc '1234567')
hc1=${seed:1:1}
#git1="\$(__git_ps1 ' \[\e[01;36m\](%s)\[\e[00m\]')"
#export PS1=" \${debian_chroot:+\[\e[01;31m\](\$debian_chroot)}\[\e[01;32m\]\t \[\e[00;32m\](?\$? J\j)${git1}\[\e[00m\]\\n \[\e[01;32m\]\u\[\e[00m\]@\[\e[01;3${hc1}m\]\h\[\e[00m\]:\[\e[01;32m\]\w\[\e[00m\] \$ "
export PS2='> '
export PS3='> '
export PS4='+ '
PROMPT_COMMAND='__git_ps1 " \${debian_chroot:+\[\e[01;31m\](\$debian_chroot)}\[\e[01;32m\]\t \[\e[00;32m\](?\$? J\j)" "\[\e[00m\]\\n \[\e[01;32m\]\u\[\e[00m\]@\[\e[01;3${hc1}m\]\h\[\e[00m\]:\[\e[01;32m\]\w\[\e[00m\] \$ " " \[\e[01;36m\](%s\[\e[01;36m\])"'

# cursor color
printf '%b' '\e]12;white\a'

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

export TERM=xterm-256color
