#!/bin/sh

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

[ -z "$TMUX" ] && export TERM=xterm-256color

export FZF_DEFAULT_OPTS="--border --info=inline -m"
export FZF_DEFAULT_COMMAND="fdfind --follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__}"

export BROWSER="firefox"
export EDITOR="nvim"
export READER="zathura"

export GPG_TTY=`tty`
export RANGER_LOAD_DEFAULT_RC=FALSE
export VIRTUAL_ENV_DISABLE_PROMPT=1

export NOTES_DIRECTORY="$HOME/GoogleDrive/Notes"
export TODO_DIR="$HOME/GoogleDrive/Notes/todos"
export DOTFILES="$HOME/dotfiles"
export VIM_DIR="$HOME/dotfiles/vim"
export SCRIPTS_DIR="$HOME/scripts"
export COPYIGNORE="$HOME/dotfiles/copyignore"

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$SCRIPTS_DIR

export PATH=$PATH:/usr/local/go/bin

export GOPATH=$HOME/go
export GOPATH=$GOPATH:/home/aarya/repos/aarya-bhatia/uiuc/cs425/gitlab/mp1
export GOPATH=$GOPATH:/home/aarya/repos/aarya-bhatia/uiuc/cs425/gitlab/mp2
export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/bin:/home/$USER/.local/bin:/home/$USER/pyvenv/bin
export PATH=$PATH:/snap/bin

export LATITUDE="41.11"
export LONGITUDE="-88.24"

# file permission mask
# This will disable all permissions for "others"
umask 0027

# # Start X server
# if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#   exec startx
# fi

