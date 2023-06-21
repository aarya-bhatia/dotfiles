source $HOME/dotfiles/default-bashrc

if [ -d /usr/share/fzf ]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

alias vi='vim'
alias audio='pulseaudio-ctl'
alias bright='brightnessctl'
alias tree='tree -C --gitignore'
alias rsync='rsync -a --progress'
alias rclone='rclone -P'
alias df='df -h'

# export FZF_DEFAULT_OPTS="--border --info=inline --bind 'enter:become(vim {})'"
export FZF_DEFAULT_OPTS="--border --info=inline -m"
export FZF_DEFAULT_COMMAND='fd --follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__}'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export EDITOR="vim"
export GPG_TTY=`tty`
export NOTES_DIRECTORY=$HOME/GoogleDrive/Laptop/notes
export VIM_DIR=$HOME/dotfiles/vim
