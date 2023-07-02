#!/bin/bash
screensaver='/usr/share/backgrounds/archlinux/wild.png'
message='xautolock: Screen will lock in 15 seconds.'
xautolock -time 10 \
  -locker "i3lock -n -e -c 000000 -i $screensaver" \
  -notify 10 --notifier "notify-send '$message'" \
  -detectsleep -killtime 10 -killer "systemctl suspend" &

