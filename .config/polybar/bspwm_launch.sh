#!/bin/sh
pgrep -f polybar && polybar-msg cmd quit
polybar bspwm 2>&1 >/tmp/polybar.log & disown
MONITOR=HDMI-1 polybar bspwm 2>&1 >/tmp/polybar1.log &
echo "Polybar launched..."
