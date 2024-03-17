#!/bin/sh
pgrep -f polybar && polybar-msg cmd quit
polybar bspwm 2>&1 >/tmp/polybar.log & disown
echo "Polybar launched..."
