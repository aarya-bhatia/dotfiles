#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

HISTSIZE=
HISTFILESIZE=

shopt -s histappend
shopt -s autocd
shopt -s checkwinsize

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

if [ -d /usr/share/fzf ]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

eval $(keychain --eval --quiet id_rsa ~/.ssh/aaryab2)
