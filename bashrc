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
alias v="vim"
alias z="zathura"
alias sv="sudo vim"
alias vim="nvim"
alias cp="cp -vi"
alias tree="tree -C --gitignore"
alias rsync="rsync -avu --exclude-from=$COPYIGNORE"
alias rclone="rclone -P"
alias df="df -h"
alias open="mimeopen"
alias xsel="xsel -b"
alias pwd="pwd -P"
alias mkdir="mkdir -pv"
alias py="python3"
alias rm="trash-put"
alias bc="bc -q"
alias du="du -h"

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

alias valgrind="valgrind --leak-check=full --show-leak-kinds=all"
alias scrot="escrotum"
alias mutt="neomutt"
alias sc="sc-im"
alias bat="bat --style=plain --theme=gruvbox-dark"
alias cat="bat --plain"
alias bathelp="bat --plain --language=help"
alias ta="tmux attach || tmux"
alias t="todo.sh -d /home/aarya/dotfiles/todo.cfg"
alias send_alert="$SCRIPTS_DIR/alert-service/send_alert.py"
alias fvim="$SCRIPTS_DIR/fzf_vim.py"
alias vbox="VBoxManage"

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
function vman(){
  [ ! $# -eq 0 ] && man "$@" | col -b | vim -R -c "set ft=man" -
}

export PS1="\$(pwd)$ "

# Load python venv
[ -d $HOME/pyvenv ] && source $HOME/pyvenv/bin/activate

alias toggle-notifications="dunstctl set-paused toggle"

export LATITUDE="41.11"
export LONGITUDE="-88.24"

alias sshpass="sshpass -f ~/passwd"

# Automatically Load the SSH Agent on Login
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
fi

lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    cd "$(command lf -print-last-dir "$@")"
}

export GOPATH=$GOPATH:/home/aarya/repos/aarya-bhatia/uiuc/cs425/gitlab/mp2

