alias v=$EDITOR
alias vim=$EDITOR

alias ..="cd .."
alias g="git"
alias py="python3"

alias t="tmux"
alias ta="tmux a"
alias tq="tmux kill-session"

alias grep="grep -E --color=auto"

alias la="ls --color=auto -Ah"
alias ll="ls --color=auto -alFh"
alias l="ls --color=auto -CF"
alias ls="ls --color=auto"
alias l.="ls -d .*"

which bat &>/dev/null && alias cat="bat --plain"
which trash-put &>/dev/null && alias rm="trash-put"

