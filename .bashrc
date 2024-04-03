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

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# [ -z "$TMUX" ] && export TERM=xterm-256color

fd=fd
bat=bat

if uname -a | grep -q -i -E "debian|ubuntu"; then
	fd=fdfind
	bat=batcat
fi

export COPYIGNORE=$HOME/copyignore

alias fd=$fd
alias bat="$bat --style=plain"
alias cat="$bat --plain"
alias bathelp="$bat --plain --language=help"

alias s="systemctl"
alias ss="sudo systemctl"
alias j="journalctl"
alias g="git"
alias p="sudo pacman"
alias y="yay"
alias v="nvim"
alias vim="nvim"
alias nv="nvim"
alias z="zathura"
alias cp="cp -vi"
alias tree="tree -C --gitignore"
alias rsync="rsync -avu --exclude-from=$COPYIGNORE"
alias rclone="rclone -P"
alias df="df -hT"
alias open="mimeopen"
alias xsel="xsel -b"
alias pwd="pwd -P"
alias cd="cd -P"
alias mkdir="mkdir -pv"
alias py="python3"
alias rm="trash-put"
alias bc="bc -q"
alias du="du -h"
alias free="free -h"

if which lsd 2>&1 >/dev/null; then
	alias ls="lsd -X"
	alias ll="lsd -AlFh"
	alias la="lsd -Ah"
	# alias l="ls"
else
	alias ls="ls --color=auto --group-directories-first"
	alias ll="ls --color=auto -alFh"
	alias la="ls --color=auto -Ah"
	alias l="ls --color=auto -CF"
fi

alias ip="ip --color=auto"
alias diff="diff --color=auto"
alias grep="grep -E --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias dmesg="dmesg --color=auto"

alias ta="tmux attach || tmux"
alias vbox="VBoxManage"
alias bright="brightnessctl"

alias paclean="sudo pacman -Rsn $(pacman -Qdtq)"

# alias valgrind="valgrind --leak-check=full --show-leak-kinds=all"

alias showkey="xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf \"%-3s %s\n\", \$5, \$8 }'"
alias dot="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias weather="curl https://wttr.in/?m"
alias t=tmux
alias y=yay

alias notes="printf \"\n## $(date +'%Y-%m-%d %H:%M:%S')\n\n\" >> /home/aarya/GoogleDrive/Notes/$(date +"%Y-%m").md; vim /home/aarya/GoogleDrive/Notes/$(date +"%Y-%m").md -c 'norm G'"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -d /usr/share/fzf ]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

# open man page in vim
vman(){
  [ ! $# -eq 0 ] && man "$@" | col -b | vim -R -c "set ft=man" -
}

# Load python venv
[ -d $HOME/pyvenv ] && source $HOME/pyvenv/bin/activate

lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}

alias keychain="keychain --dir /run/user/$UID --absolute"
eval $(keychain --eval --quiet id_rsa ~/.ssh/aaryab2)

neofetch
