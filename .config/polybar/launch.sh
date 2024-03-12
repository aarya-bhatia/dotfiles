#!/bin/sh
pgrep -f polybar && polybar-msg cmd quit
polybar example 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
