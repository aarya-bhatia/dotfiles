#!/bin/sh

# setfont ter-120n

echo $(date) "hello from .bash_profile" >> $HOME/i3.log

if [ -f $HOME/.bashrc ]; then
	source $HOME/.bashrc
else
	echo "Failed to source bashrc" >> $HOME/i3.log
fi

# xset s 0 0

# Automatically Load the SSH Agent on Login
# if [ -z "$SSH_AUTH_SOCK" ] ; then
#     eval "$(ssh-agent -s)"
#     ssh-add ~/.ssh/id_rsa
# fi

# # Start X server
# if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#   exec startx
# fi

