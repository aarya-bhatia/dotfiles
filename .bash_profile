#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export TERMINAL=alacritty
export EDITOR=vim
export READER=zathura
export BROWSER=firefox
export MUSIC_PLAYER=mpv
export VIDEO_PLAYER=smplayer
export FILE_VIEWER=thunar
export IMAGE_VIEWER=nsxiv
export MAIL_READER=thunderbird

# seattle
export LATITUDE=47.614442
export LONGITUDE=-122.34172

# chicago
# export LATITUDE=40.6063
# export LONGITUDE=-74.1774

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export PASSWORD_STORE_DIR=$HOME/nextcloud/passwords

export CARGO_HOME=$XDG_DATA_HOME/cargo
export COPYIGNORE=$HOME/copyignore
export DOTNET_CLI_HOME=$XDG_DATA_HOME/dotnet
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export GPG_TTY=`tty`
export HISTFILE=$XDG_STATE_HOME/bash/history
export ICEAUTHORITY=$XDG_CACHE_HOME/ICEauthority
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export GOPATH=$XDG_DATA_HOME/go
export PATH=$PATH:$GOPATH/bin

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
