#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

if which xidlehook; then

	# Run xidlehook
	xidlehook \
		`# Don't lock when there's a fullscreen application` \
		--not-when-fullscreen \
		`# Don't lock when there's audio playing` \
		--not-when-audio \
		`# Dim the screen after 60 seconds, undim if user becomes active` \
		--timer 60 \
		'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
		'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
		`# Undim & lock after 10 more seconds` \
		--timer 10 \
		'xrandr --output "$PRIMARY_DISPLAY" --brightness 1; i3lock' \
		'' \
		`# Finally, suspend an hour after it locks` \
		--timer 3600 \
		'systemctl suspend' \
		''

elif which xautolock; then

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
fi
