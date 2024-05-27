#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# disable all permissions for others
umask 0027

HISTSIZE=
HISTFILESIZE=

shopt -s histappend
shopt -s autocd
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export COPYIGNORE=$HOME/copyignore

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

if [ -d /usr/share/fzf ]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

# Load python venv
[ -d $HOME/pyvenv ] && source $HOME/pyvenv/bin/activate

which bat &>/dev/null && alias cat="bat --plain"
which trash-put &>/dev/null && alias rm="trash-put"

alias ip="ip --color=auto"
alias diff="diff --color=auto"
alias grep="grep -E --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias dmesg="dmesg --color=auto"

alias sudo="sudo "
alias s="sudo systemctl"
alias j="sudo journalctl"
alias p="sudo pacman"
alias g="git"
alias y="yay"
alias v="nvim"
alias vim="nvim"
alias z="zathura"
alias cp="cp -vi"
alias mv="mv -i"
alias tree="tree -C --gitignore"
alias rsync="rsync -av"
alias rclone="rclone -P"
alias df="df -hT"
alias open="mimeopen"
alias xopen="xdg-open"
alias xsel="xsel -b"
alias pwd="pwd -P"
alias cd="cd -P"
alias mkdir="mkdir -pv"
alias py="python3"
alias bc="bc -q"
alias du="du -h"
alias free="free -h"
alias iv="nsxiv"
alias mutt="neomutt"
alias mutt1="neomutt -F ~/.config/mutt/accounts/aarya.bhatia1678@gmail.com"
alias mutt2="neomutt -F ~/.config/mutt/accounts/aarya.bhatia6@gmail.com"

alias vbox="VBoxManage"
alias bright="brightnessctl"
alias paclean="sudo pacman -Rsn $(pacman -Qdtq)"
alias showkey="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias dot="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias t=tmux
alias notes="printf \"\n## $(date +'%Y-%m-%d %H:%M:%S')\n\n\" >> /home/aarya/GoogleDrive/Notes/$(date +"%Y-%m").md; vim /home/aarya/GoogleDrive/Notes/$(date +"%Y-%m").md -c 'norm G'"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ls="ls --color=auto --group-directories-first"
alias ll="ls --color=auto -alFh"
alias la="ls --color=auto -Ah"
alias l="ls --color=auto -CF"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias please="sudo"
alias todo="todo.sh"

alias n="notmuch"

# alias valgrind="valgrind --leak-check=full --show-leak-kinds=all"

# open man page in vim
vman(){
  [ ! $# -eq 0 ] && man "$@" | col -b | vim -R -c "set ft=man" -
}

lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}

alias keychain="keychain --dir /run/user/$UID --absolute"
eval $(keychain --eval --quiet id_rsa ~/.ssh/aaryab2)

alias tau="tmux new-session -A -s $USER"
alias tas="tmux new-session -A -s system"
alias ta="tmux new-session -A -s"
alias trayer='trayer --edge top --align center --width 6'

source ~/scripts/bash_completion

# if [ "$TERM" != "screen-256color" ]; then
# 	tmux new-session -A -s "$USER"
# fi

# fortune
# neofetch
pfetch
