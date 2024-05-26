#!/bin/sh
if pgrep -f polybar; then
	polybar-msg cmd quit || killall polybar
fi

polybar bspwm 2>&1 >> /tmp/polybar.log & disown

echo "Polybar launched..."
