#!/bin/sh
source /home/aarya/pyvenv/bin/activate

killall -q lemonbar
while pgrep -u $UID -x lemonbar >/dev/null; do sleep 1; done

/home/aarya/.config/lemonbar/lemonconfig.py | \
	lemonbar -p -g x26++ -f "Hack Nerd Font:size=9.0" \
		-f "Noto Color Emoji" -F#ffffff -B#222222 \
		-U#268BD2 -u 2
