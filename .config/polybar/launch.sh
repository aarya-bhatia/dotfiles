#!/bin/sh
if pgrep -f polybar; then
	polybar-msg cmd quit || killall polybar
fi

bar=${1:-bspwm}
polybar "$bar" &>>/tmp/polybar.log & disown

echo "Polybar launched..."
