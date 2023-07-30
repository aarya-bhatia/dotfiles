#!/bin/sh

[ -f ~/.bashrc ] && source ~/.bashrc

[ -z "$TMUX" ] && export TERM=xterm-256color

export FZF_DEFAULT_OPTS="--border --info=inline -m"
export FZF_DEFAULT_COMMAND="fd --follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__}"
export BROWSER="firefox"
export EDITOR="nvim"
export READER="zathura"
export GPG_TTY=`tty`
export PATH=$PATH:/usr/local/bin
export PATH=$HOME/.config/rofi/scripts:$PATH

export NOTES_DIRECTORY=$HOME/GoogleDrive/Notes
export DOTFILES=$HOME/dotfiles
export VIM_DIR=$HOME/dotfiles/vim

export RANGER_LOAD_DEFAULT_RC=FALSE

umask 0027 # file permission mask

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

