#!/bin/sh

# echo "bashrc loaded" >> $HOME/i3.log

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# case $- in
#     *i*) ;;
#       *) return;;
# esac

# disable all permissions for others
umask 0027

HISTSIZE=
HISTFILESIZE=

shopt -s histappend
shopt -s autocd
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[ -z "$TMUX" ] && export TERM=xterm-256color

fd=fd
bat=bat

if uname -a | grep -q -i -E "debian|ubuntu"; then
	fd=fdfind
	bat=batcat
fi

alias fd=$fd
alias bat="$bat --style=plain --theme=gruvbox-dark"
alias cat="$bat --plain"
alias bathelp="$bat --plain --language=help"

export LESS="-iR"

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

# export GOROOT=/usr/local/go/
# export GOBIN=$GOPATH/bin
export GOPATH=$HOME/go
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
alias ta="tmux attach || tmux"
alias vbox="VBoxManage"
alias bright="brightnessctl"

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

# Load python venv
[ -d $HOME/pyvenv ] && source $HOME/pyvenv/bin/activate

alias toggle-notifications="dunstctl set-paused toggle"
alias sshpass="sshpass -f ~/passwd ssh"

lfcd () {
    cd "$(command lf -print-last-dir "$@")"
}

alias notes="$EDITOR /home/aarya/GoogleDrive/Notes/$(date +"%Y-%m").md"

# export PS1="\$(pwd)$ "

