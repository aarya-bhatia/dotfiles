#!/bin/sh
source /home/aarya/pyvenv/bin/activate
pgrep -f polybar && polybar-msg cmd quit

polybar bspwm 2>&1 >> /tmp/polybar.log & disown
polybar bottom 2>&1 >> /tmp/polybar.log & disown

if xrandr | grep "HDMI-1 connected"; then
	MONITOR=HDMI-1 polybar bspwm 2>&1 >> /tmp/polybar.log & disown
	MONITOR=HDMI-1 polybar bottom 2>&1 >> /tmp/polybar.log & disown
fi

echo "Polybar launched..."
