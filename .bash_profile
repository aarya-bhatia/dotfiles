#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# export XDG_SESSION_TYPE=X11

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_RUNTIME_DIR=/run/user/$UID

export DOTNET_CLI_HOME=$XDG_DATA_HOME/dotnet
export GOPATH=$XDG_DATA_HOME/go
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export HISTFILE=$XDG_STATE_HOME/bash/history
export ICEAUTHORITY=$XDG_CACHE_HOME/ICEauthority
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/pass
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc

export GPG_TTY=`tty`
export LESS="-iR"
export BROWSER="firefox"
export EDITOR="nvim"
export READER="zathura"
export TERMINAL=alacritty
export VIRTUAL_ENV_DISABLE_PROMPT=1
export DOTFILES="$HOME/dotfiles"
export SCRIPTS_DIR="$HOME/scripts"
export COPYIGNORE="$HOME/dotfiles/copyignore"

export FZF_DEFAULT_OPTS="--border --info=inline -m"
export FZF_DEFAULT_COMMAND="fd --follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__,undodir,plugged,.cache}"

export LATITUDE="41.11"
export LONGITUDE="-88.24"

# colored man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/snap/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/pyvenv/bin
export PATH=$PATH:$GOPATH/bin
