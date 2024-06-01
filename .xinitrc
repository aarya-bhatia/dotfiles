#!/bin/sh
session=${2:-dwm}

# Run command in background unless already running...
run() {
  if ! pgrep -f "$1"; then
    $@ &>/dev/null &
  fi
}

run dunst &
run mpd &
run nightlight.sh auto &
run xss-lock --transfer-sleep-lock -- betterlockscreen -l &
# run picom --backend glx --xrender-sync-fence &

numlockx on &
wallpaper.py &

startdwm() {
        run dwmblocks &
        run sxhkd -c ~/.config/sxhkd/sxhkdrc.common &
        while true; do dwm; done
}

case $session in
    dwm)        startdwm;;
    bspwm)      exec bspwm;;
    i3)         exec i3;;
    xfce)       exec xfce4-session;;
    cinnamon)   exec cinnamon-session;;
    *)          exec $arg;;
esac
