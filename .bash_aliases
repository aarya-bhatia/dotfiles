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

alias b=brazil
alias bb=brazil-build
alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'
alias sam="brazil-build-tool-exec sam"

alias auth="kinit -f && mwinit"

which bat &>/dev/null && alias cat="bat --plain"
which trash-put &>/dev/null && alias rm="trash-put"

