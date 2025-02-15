
# editor aliases
alias v=$EDITOR
alias vim=$EDITOR

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

# aliases for common programs
alias g="git"
alias py="python3"

alias t="tmux"
alias ta="tmux a"
alias tq="tmux kill-session"

# custom program aliases, if installed
which hyfetch &>/dev/null && alias ff=hyfetch
which bat &>/dev/null && alias cat="bat --plain"
which trash-put &>/dev/null && alias rm="trash-put"

# short scripts
alias trayer="trayer --edge top --align center --width 6"
alias memcheck="valgrind --leak-check=full --show-leak-kinds=all"
alias showkey="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"

showprop() {
  xprop | awk '
  /^WM_CLASS/{sub(/.* =/, "instance:"); sub(/,/, "\nclass:"); print}
  /^WM_NAME/{sub(/.* =/, "title:"); print}'
}

