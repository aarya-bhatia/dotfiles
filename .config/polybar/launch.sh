#!/bin/sh
pgrep -f polybar && polybar-msg cmd quit
polybar bspwm 2>&1 | tee -a /tmp/polybar.log & disown
polybar bspwm1 2>&1 | tee -a /tmp/polybar1.log & disown
echo "Polybar launched: bspwm bspwm1"
