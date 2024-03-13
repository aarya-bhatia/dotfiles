#!/bin/sh
pgrep -f polybar && polybar-msg cmd quit
polybar example 2>&1 | tee -a /tmp/polybar.log & disown
polybar external 2>&1 | tee -a /tmp/polybar1.log & disown
echo "Polybar launched..."
