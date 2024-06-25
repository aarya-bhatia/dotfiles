#!/bin/sh

if [ ! -f ~/.pictures ]; then
	find $HOME/Pictures/ -type d >> ~/.pictures
	echo ~/Media/Wallpapers >> ~/.pictures
fi

OPENER=${1:-nsxiv}

sel=$(cat ~/.pictures | dmenu -i -l 20)
[ -n "$sel" ] && $OPENER "$sel"

