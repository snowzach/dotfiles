# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Make control arrows work from PuTTY
#bind '"\eOC":forward-word'
#bind '"\eOD":backward-word'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ts2date="printf '%(%c)T\n'; TZ=UTC printf '%(%c)T\n'"

umask 022
echo -ne "\e]0;${USER}@${HOSTNAME}\a"

. ~/.bash_prompt
[ -f ~/.bash_local ] && . ~/.bash_local
