#!/bin/sh

[ -z "$TMUX" ] && export TERM=xterm-256color

fd=fd
bat=bat

if uname -a | grep -q -E "debian|Ubuntu"; then
	fd=fdfind
	bat=batcat
fi

alias fd=$fd
alias bat="$bat --style=plain --theme=gruvbox-dark"
alias cat="$bat --plain"
alias bathelp="$bat --plain --language=help"

export FZF_DEFAULT_OPTS="--border --info=inline -m"
export FZF_DEFAULT_COMMAND="${fd} --follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__}"

export BROWSER="firefox"
export EDITOR="nvim"
export READER="zathura"

export GPG_TTY=`tty`
export VIRTUAL_ENV_DISABLE_PROMPT=1

export NOTES_DIRECTORY="$HOME/GoogleDrive/Notes"
export TODO_DIR="$HOME/GoogleDrive/Notes/todos"
export DOTFILES="$HOME/dotfiles"
export VIM_DIR="$HOME/dotfiles/vim"
export SCRIPTS_DIR="$HOME/scripts"
export COPYIGNORE="$HOME/dotfiles/copyignore"

export PATH=$PATH:$SCRIPTS_DIR

export GOROOT=/usr/local/go/
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:${GOPATH}/bin:${GOROOT}/bin

export PATH=$PATH:/home/$USER/.local/bin
export PATH=$PATH:/home/$USER/pyvenv/bin

export PATH=$PATH:/usr/local
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/nvim/bin

export PATH=$PATH:/snap/bin

export LATITUDE="41.11"
export LONGITUDE="-88.24"

# disable all permissions for others
umask 0027

HISTSIZE=
HISTFILESIZE=

shopt -s histappend
shopt -s autocd
shopt -s checkwinsize

alias s="systemctl"
alias j="journalctl"
alias ss="systemctl status"
alias S="sudo systemctl"
alias g="git"
alias p="sudo pacman"
alias y="yay"
alias v="nvim"
alias z="zathura"
alias sv="sudo vim"
alias vim="nvim"
alias cp="cp -vi"
alias tree="tree -C --gitignore"
alias rsync="rsync -avu --exclude-from=$COPYIGNORE"
alias rclone="rclone -P"
alias df="df -hT"
# alias open="mimeopen"
alias xsel="xsel -b"
alias pwd="pwd -P"
alias cd="cd -P"
alias mkdir="mkdir -pv"
alias py="python3"
alias rm="trash-put"
alias bc="bc -q"
alias du="du -h"
alias free="free -h"

alias ls="ls --color=auto --group-directories-first"
alias ll="ls --color=auto -alFh"
alias la="ls --color=auto -Ah"
alias l="ls --color=auto -CF"

alias ip="ip --color=auto"
alias diff="diff --color=auto"
alias grep="grep -E --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias dmesg="dmesg --color=auto"

alias valgrind="valgrind --leak-check=full --show-leak-kinds=all"
# alias scrot="escrotum"
alias mutt="neomutt"
alias sc="sc-im"
alias ta="tmux attach || tmux"
alias t="todo.sh -d /home/aarya/dotfiles/todo.cfg"
alias send_alert="$SCRIPTS_DIR/alert-service/send_alert.py"
alias fvim="$SCRIPTS_DIR/fzf_vim.py"
alias vbox="VBoxManage"
alias bright="brightnessctl"
alias timer="termdown"

export LESS="-iR"

# vim pager
alias view="col -b | vim -R -"

# fuzzy find man page
alias fman="man -k . | fzf --prompt='Man > ' | awk '{print $1}' | xargs -r man"

# Add an "alert" alias for long running commands. Use like so: `sleep 10; alert`
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -d /usr/share/fzf ]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

# open man page in vim
vman(){
  [ ! $# -eq 0 ] && man "$@" | col -b | vim -R -c "set ft=man" -
}

export PS1="\$(pwd)$ "

# Load python venv
[ -d $HOME/pyvenv ] && source $HOME/pyvenv/bin/activate

alias toggle-notifications="dunstctl set-paused toggle"

alias sshpass="sshpass -f ~/passwd ssh"

# Automatically Load the SSH Agent on Login
# if [ -z "$SSH_AUTH_SOCK" ] ; then
#     eval "$(ssh-agent -s)"
#     ssh-add ~/.ssh/id_rsa
# fi

lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

alias notes="$EDITOR /home/aarya/GoogleDrive/Notes/$(date +"%Y-%m").md"

