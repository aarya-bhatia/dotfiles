source $HOME/dotfiles/default-bashrc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases

alias vi='vim'
alias audio='pulseaudio-ctl'
alias bright='brightnessctl'
alias tree='tree -C --gitignore'

# Variables

export FZF_DEFAULT_OPTS='--border --info=inline'
export FZF_DEFAULT_COMMAND='fd --follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__}'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export EDITOR="vim"
export GPG_TTY=`tty`
export NOTES_DIRECTORY=$HOME/GoogleDrive/Laptop/notes
export VIM_DIR=$HOME/dotfiles/vim

