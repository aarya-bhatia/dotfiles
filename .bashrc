#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

[ -d "venv" ] && . venv/bin/activate

[ -z "$SSH_AUTH_SOCK" ] && eval `ssh-agent`

