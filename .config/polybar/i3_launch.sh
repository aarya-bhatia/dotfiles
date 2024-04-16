#!/bin/sh
source /home/aarya/pyvenv/bin/activate

if pgrep -f polybar; then
	polybar-msg cmd quit
fi

polybar i3 &>> /tmp/polybar.log & disown

echo "Polybar launched..."
