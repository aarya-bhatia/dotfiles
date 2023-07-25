stty -ixon # disable ctrl-s and ctrl-q
# append to the history file, don't overwrite it
shopt -s histappend
# allows us to cd into directory by typing its name
shopt -s autocd
# infinite history
HISTSIZE=
HISTFILESIZE=
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

alias s='systemctl'
alias ss='sudo systemctl'
alias g='git'
alias p='sudo pacman'
alias v='vim'
alias sv='sudo vim'
alias vim='nvim'
alias audio='pulseaudio-ctl'
alias bright='brightnessctl'
alias tree='tree -C --gitignore'
alias rsync='rsync -avu --exclude-from=/home/aarya/dotfiles/copyignore'
alias rclone='rclone -P'
alias df='df -h'
# alias open='xdg-open'
alias open='mimeopen'
alias xsel='xsel -b'
alias rm='mkdir -p ~/.trash && mv -t ~/.trash'
alias RM='/bin/rm'
alias emptytrash='/bin/rm -rf ~/.trash'
alias i3lock='i3lock --ignore-empty-password -c 000000 -i "/usr/share/backgrounds/archlinux/wild.png"'
alias addpass='pass insert -m'
alias fvim='$HOME/dotfiles/scripts/fzf-vim.py'
alias pwd='pwd -P' # get fully resolved path of directory
alias mkdir='mkdir -pv'
alias bat='bat --style=plain --theme=gruvbox-dark'
alias sc='sc-im'

alias ls='ls --color=auto --group-directories-first'
alias ll='ls --color=auto -alFh'
alias la='ls --color=auto -Ah'
alias l='ls --color=auto -CF'

# Add an "alert" alias for long running commands. Use like so: `sleep 10; alert`
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ip="ip --color=auto"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias dmesg="dmesg --color=auto"

alias cat="bat --plain"
alias bathelp="bat --plain --language=help"

export PS1='$(pwd)$ ' # Prompt

[ -z "$TMUX" ] && export TERM=xterm-256color

if [ -d /usr/share/fzf ]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

export FZF_DEFAULT_OPTS="--border --info=inline -m"
export FZF_DEFAULT_COMMAND='fd --follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__}'
export BROWSER="firefox"
export EDITOR="nvim"
export READER="zathura"
export GPG_TTY=`tty`
export NOTES_DIRECTORY=$HOME/GoogleDrive/Laptop/notes
export VIM_DIR=$HOME/dotfiles/vim
export DOTFILES=$HOME/dotfiles

export PATH=$PATH:/usr/local/bin
export PATH=$HOME/.config/rofi/scripts:$PATH

# Load python venv
export VIRTUAL_ENV_DISABLE_PROMPT=1
[ -d $HOME/pyenv ] && source $HOME/pyvenv/bin/activate

function screenshot() {
  scrot -F "/home/aarya/screenshots/%Y-%m-%d_%H:%M:%S_\$wx\$h.png" -e 'optipng $f'
}

function cloudsync(){
  rclone copy --exclude-from=$DOTFILES/copyignore -v --update ~/GoogleDrive gdrive:
  rclone copy --exclude-from=$DOTFILES/copyignore -v --update gdrive: ~/GoogleDrive
  rclone copy --exclude-from=$DOTFILES/copyignore -v --update ~/OneDrive onedrive:
  rclone copy --exclude-from=$DOTFILES/copyignore -v --update onedrive: ~/OneDrive
}

# vim pager
alias view='col -b | vim -R -'

# fuzzy find man page
alias fman="man -k . | fzf --prompt='Man > ' | awk '{print $1}' | xargs -r man"

# open man page in vim
function vman(){
  [ ! $# -eq 0 ] && man "$@" | col -b | vim -R -c 'set ft=man' -
}

