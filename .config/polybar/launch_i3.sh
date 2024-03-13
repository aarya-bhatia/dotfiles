#!/bin/sh
pgrep -f polybar && polybar-msg cmd quit
polybar i3 2>&1 | tee -a /tmp/polybar_i3.log & disown
echo "Polybar launched: i3"
