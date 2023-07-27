#!/bin/sh
screensaver='/usr/share/backgrounds/archlinux/wild.png'
message='xautolock: Screen will lock soon..'
xautolock -time 5 \
  -locker "betterlockscreen --lock" \
  -notify 10 --notifier "notify-send '$message'" \
  -detectsleep -killtime 10 -killer "systemctl suspend" &

