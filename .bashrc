#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=5000
HISTFILESIZE=10000
shopt -s histappend

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

fd_opts="--follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__,undodir,plugged,.cache}"

if which fdfind &>/dev/null; then
    find_cmd="fdfind $fd_opts"
elif which fd &>/dev/null; then
    find_cmd="fd $fd_opts"
else
    find_cmd=find
fi

export FZF_DEFAULT_COMMAND="$find_cmd"
export FZF_DEFAULT_OPTS="--border --info=inline -m"

if which batcat &>/dev/null; then
    cat_cmd="batcat --style=plain"
elif which bat &>/dev/null; then
    cat_cmd="bat --style=plain"
else
    cat_cmd=cat
fi

alias cat="$cat_cmd"

if which trash-put &>/dev/null; then
    rm_cmd="trash-put"
else
    rm_cmd="rm -r"
fi

alias rm="$rm_cmd"

alias v=$EDITOR

# add options to common commands
alias ..="cd .."
alias cp="cp -i"
alias df="df -hT"
alias du="du -h"
alias free="free -h"
alias mkdir="mkdir -pv"
alias mv="mv -i"
alias pwd="pwd -P"
alias tree="tree -C --gitignore"

# add colors
alias diff="diff --color=auto"
alias dmesg="dmesg --color=auto"
alias grep="grep --color=auto"
alias egrep="grep -E --color=auto"
alias fgrep="grep -F --color=auto"
alias ip="ip --color=auto"

# ls aliases
alias la="ls --color=auto -Ah"
alias ll="ls --color=auto -lrtFh"
alias l="ls --color=auto -CF"
alias l.="ls -d .*"
alias ls="ls --color=auto --group-directories-first"

# short forms
alias ff="fastfetch"
alias g="git"
alias j="sudo journalctl"
alias light="brightnessctl"
alias mutt="neomutt"
alias open="mimeopen"
alias please="sudo "
alias p="sudo pacman"
alias py="python3"
alias s="sudo systemctl"
alias sudo="sudo "
alias sxiv="nsxiv"
alias ta="tmux a"
alias todo="todo.sh"
alias t="tmux"
alias vbox="VBoxManage"
alias xopen="xdg-open"
alias y="yay"
alias z="zathura"
alias b="brightness.sh"

# long commands
alias trayer="trayer --edge top --align center --width 6"
alias memcheck="valgrind --leak-check=full --show-leak-kinds=all"
alias showkey="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"

showprop() {
    xprop | awk '
	/^WM_CLASS/{sub(/.* =/, "instance:"); sub(/,/, "\nclass:"); print}
	/^WM_NAME/{sub(/.* =/, "title:"); print}'
}

alias nv="nvim"

# functions
calc() {
    echo $@ | bc -q
}

[ -d "venv" ] && . venv/bin/activate
[ -d ".venv" ] && . .venv/bin/activate

if [ -z "$SSH_AUTH_SOCK" ]; then
        eval `ssh-agent`
fi
