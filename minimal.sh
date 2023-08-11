[ -f ~/.bashrc ] && source ~/.bashrc

HISTSIZE=
HISTFILESIZE=

shopt -s histappend
shopt -s autocd
shopt -s checkwinsize

[ -z "$TMUX" ] && export TERM=xterm-256color

if ! command -v fd &> /dev/null
then
  export FZF_DEFAULT_COMMAND="fd --follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__}"
fi

export FZF_DEFAULT_OPTS="--border --info=inline -m"

export EDITOR="vim"
export DOTFILES="$HOME/dotfiles"
export VIM_DIR="$HOME/dotfiles/vim"
export SCRIPTS_DIR="$HOME/scripts"
export COPYIGNORE="$HOME/dotfiles/copyignore"

export PATH=$PATH:/usr/local/bin

umask 0027

alias s="systemctl"
alias ss="sudo systemctl"
alias g="git"
alias p="sudo pacman"
alias v="vim"
alias sv="sudo vim"
alias vim="nvim"
alias tree="tree -C --gitignore"
alias rsync="rsync -avu --exclude-from=$COPYIGNORE"
alias rclone="rclone -P"
alias df="df -h"
alias xsel="xsel -b"
alias pwd="pwd -P"
alias mkdir="mkdir -pv"
alias py="python3"
alias ta="tmux attach || tmux"

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

if [ -d /usr/share/fzf ]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

alias fman="man -k . | fzf --prompt='Man > ' | awk '{print $1}' | xargs -r man"

# open man page in vim
function vman(){
  [ ! $# -eq 0 ] && man "$@" | col -b | vim -R -c "set ft=man" -
}

