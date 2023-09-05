#!/bin/bash

# Terminate already running bar instances
polybar-msg cmd quit

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar --reload mainbar 2>&1 | tee -a /tmp/polybar.log & disown

for m in $(polybar --list-monitors | cut -d":" -f1); do
	echo "Launching polybar on display: $m"
	MONITOR=$m polybar --reload example -c ~/.config/polybar/config.ini &
done
