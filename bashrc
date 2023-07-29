HISTSIZE=
HISTFILESIZE=

stty -ixon # disable ctrl-s and ctrl-q
shopt -s histappend
shopt -s autocd
shopt -s checkwinsize

alias s="systemctl"
alias ss="sudo systemctl"
alias g="git"
alias p="sudo pacman"
alias v="vim"
alias sv="sudo vim"
alias vim="nvim"
alias tree="tree -C --gitignore"
alias rsync="rsync -avu --exclude-from=/home/aarya/dotfiles/copyignore"
alias rclone="rclone -P"
alias df="df -h"
alias open="mimeopen"
alias xsel="xsel -b"
alias fvim="$HOME/dotfiles/scripts/fzf-vim.py"
alias pwd="pwd -P"
alias mkdir="mkdir -pv"
alias py="python3"

alias rm="mkdir -p ~/.trash && mv -t ~/.trash"
alias RM="/bin/rm"
alias emptytrash="/bin/rm -rf ~/.trash"

alias ls="ls --color=auto --group-directories-first"
alias ll="ls --color=auto -alFh"
alias la="ls --color=auto -Ah"
alias l="ls --color=auto -CF"

alias ip="ip --color=auto"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias dmesg="dmesg --color=auto"

# Add an "alert" alias for long running commands. Use like so: `sleep 10; alert`
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias sc="sc-im"
alias bat="bat --style=plain --theme=gruvbox-dark"
alias cat="bat --plain"
alias bathelp="bat --plain --language=help"
alias ta="tmux attach || tmux"
alias block="betterlockscreen"
alias t="todo.sh -d /home/aarya/dotfiles/todo.cfg"

# vim pager
alias view="col -b | vim -R -"

# fuzzy find man page
alias fman="man -k . | fzf --prompt='Man > ' | awk '{print $1}' | xargs -r man"

if [ -d /usr/share/fzf ]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

function screenshot() {
  scrot -F "$HOME/GoogleDrive/Pictures/screenshots/%Y-%m-%d_%H:%M:%S_\$wx\$h.png" -e 'optipng $f'
}

function cloudsync(){
  rclone copy --exclude-from=$DOTFILES/copyignore -v --update ~/GoogleDrive gdrive:
  rclone copy --exclude-from=$DOTFILES/copyignore -v --update gdrive: ~/GoogleDrive
  rclone copy --exclude-from=$DOTFILES/copyignore -v --update ~/OneDrive onedrive:
  rclone copy --exclude-from=$DOTFILES/copyignore -v --update onedrive: ~/OneDrive
}

# open man page in vim
function vman(){
  [ ! $# -eq 0 ] && man "$@" | col -b | vim -R -c "set ft=man" -
}

export PS1="\$(pwd)$ "

# Load python venv
export VIRTUAL_ENV_DISABLE_PROMPT=1
[ -d $HOME/pyvenv ] && source $HOME/pyvenv/bin/activate

export TODO_DIR="/home/aarya/GoogleDrive/Notes/todos"
