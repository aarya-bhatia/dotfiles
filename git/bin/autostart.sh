#!/bin/bash
run() {
    if which "$1" &>/dev/null; then
        if ! pgrep -f "$1" &>/dev/null; then
            echo "$@" &
            "$@" &
        fi
    fi
}


run xsetroot -cursor_name left_ptr
run numlockx on
run wallpaper

run lxpolkit
run nm-applet
run dunst
run sxhkd -c ~/.config/sxhkd/sxhkdrc.common
run nextcloud --background
run redshift -l $LATITUDE:$LONGITUDE
run xautolock -time 15 -locker "betterlockscreen --lock --off 10" -detectsleep \
    -corners "++--" -killtime 1 -killer "systemctl suspend" \
    -notify 5 -notifier "notify-send 'screen will lock'"

run statusinfo.sh

# run dwmblocks
# run mpd
# run xss-lock --transfer-sleep-lock -- betterlockscreen -l

