#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export BROWSER=chromium
export READER=zathura
export TERMINAL=alacritty
export VIDEO_PLAYER=smplayer
export IMAGE_VIEWER=nsxiv
export IMAGE_EDITOR=gimp

export CARGO_HOME=$XDG_DATA_HOME/cargo
export COPYIGNORE=$HOME/copyignore
export DOTNET_CLI_HOME=$XDG_DATA_HOME/dotnet
export EDITOR=nvim
export FZF_DEFAULT_COMMAND="fd --follow --color=auto --hidden --exclude={.git,node_modules,tmp,__pycache__,undodir,plugged,.cache}"
export FZF_DEFAULT_OPTS="--border --info=inline -m"
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export GPG_TTY=`tty`
export HISTFILE=$XDG_STATE_HOME/bash/history
export ICEAUTHORITY=$XDG_CACHE_HOME/ICEauthority
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export LESS="-iR"
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"
export PASSWORD_STORE_DIR=$HOME/git/password-store

export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export GOPATH=$XDG_DATA_HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/git/bin
export PATH=$PATH:/usr/local/bin
