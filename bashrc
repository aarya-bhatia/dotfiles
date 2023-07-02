source $HOME/dotfiles/default-bashrc

[ -z "$TMUX" ] && export TERM=xterm-256color

if [ -d /usr/share/fzf ]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

alias vi='vim'
alias vim='nvim'
alias audio='pulseaudio-ctl'
alias bright='brightnessctl'
alias tree='tree -C --gitignore'
alias rsync='rsync -avu --exclude-from=/home/aarya/copyignore'
alias rclone='rclone -P'
alias df='df -h'
alias open='xdg-open'
alias xsel='xsel -b'
alias s='systemctl'
alias rm='mkdir -p ~/.trash && mv -t ~/.trash'
alias emptytrash='/bin/rm -rf ~/.trash'
alias i3lock='i3lock --ignore-empty-password -c 000000 -i "/usr/share/backgrounds/archlinux/wild.png"'
alias addpass='pass insert -m'

function screenshot() {
  scrot -F "/home/aarya/screenshots/%Y-%m-%d_%H:%M:%S_\$wx\$h.png" -e 'optipng $f'
}

function cloudsync(){
  rclone copy --exclude-from=/home/aarya/copyignore -v --update ~/GoogleDrive gdrive:
  rclone copy --exclude-from=/home/aarya/copyignore -v --update gdrive: ~/GoogleDrive
  rclone copy --exclude-from=/home/aarya/copyignore -v --update ~/OneDrive onedrive:
  rclone copy --exclude-from=/home/aarya/copyignore -v --update onedrive: ~/OneDrive
}

export FZF_DEFAULT_OPTS="--border --info=inline -m"
export FZF_DEFAULT_COMMAND='fd --follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__}'

export EDITOR="vim"
export GPG_TTY=`tty`

export NOTES_DIRECTORY=$HOME/GoogleDrive/Laptop/notes
export VIM_DIR=$HOME/dotfiles/vim

export PATH=$PATH:/usr/local/bin
export PATH=$HOME/.config/rofi/scripts:$PATH
