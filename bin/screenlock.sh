#!/bin/bash

locktime=25 # min
killtime=15 # min
notifytime=120 # sec
corners="----" # top left - top right - botom left - bottom right

message="screen will lock in ${notifytime} seconds"
notifier="notify-send '$message'"
locker="i3lock --nofork --ignore-empty-password --no-unlock-indicator --color=505050"
killer="systemctl suspend"

if ! pgrep -f xautolock; then
	xautolock -detectsleep -time $locktime -locker "$locker" \
		-notify $notifytime -notifier "$notifier" \
		-killtime $killtime -killer "$killer" -corners $corners &
fi
