#!/bin/sh
source /home/aarya/pyvenv/bin/activate

/home/aarya/.config/lemonbar/lemonconfig.py | \
	lemonbar -p -g x26++ -f "Hack Nerd Font:size=9.6" \
		-f "Noto Color Emoji" -F#ffffff -B#222222 \
		-U#268BD2 -u 2
