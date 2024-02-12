#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

