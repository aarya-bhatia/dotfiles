#!/bin/sh
exec &>/dev/null

export XDG_SESSION_TYPE=X11
export LATITUDE=47.614442
export LONGITUDE=-122.34172

session=${2:-dwm}

# Run command in background unless already running...
run() {
    if ! pgrep -f "$1"; then
        $@ &>/dev/null &
    fi
}

xsetroot -cursor_name left_ptr
numlockx on

autostart() {
    run lxpolkit &
    # run mpd &
    run wallpaper.py &
    run nm-applet &
    run dunst &
    run dwmblocks &
    run sxhkd -c ~/.config/sxhkd/sxhkdrc.common &
    run nextcloud --background &
    run redshift -l $LATITUDE:$LONGITUDE &
    pgrep -f xautolock || xautolock -time 15 -locker "betterlockscreen --lock --off 10" -detectsleep \
        -corners "++--" -cornerdelay 5 -killtime 1 -killer "systemctl suspend" \
        -notify 5 -notifier "notify-send 'screen will lock'" &

    # run xss-lock --transfer-sleep-lock -- betterlockscreen -l &
}

startdwm() {
    while true; do
        autostart
        dwm
    done
}

case $session in
    dwm)        startdwm;;
    bspwm)      exec bspwm;;
    i3)         exec i3;;
    xfce)       exec xfce4-session;;
    cinnamon)   exec cinnamon-session;;
    *)          exec $arg;;
esac
