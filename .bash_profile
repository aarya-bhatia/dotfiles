#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa

