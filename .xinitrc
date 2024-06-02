#!/bin/sh
exec &>/dev/null

session=${2:-dwm}

# Run command in background unless already running...
run() {
  if ! pgrep -f "$1"; then
    $@ &>/dev/null &
  fi
}

numlockx on

run mpd &

startdwm() {
    run lxsession &
    run dunst &
    run dwmblocks &
    run nightlight.sh auto &
    run sxhkd -c ~/.config/sxhkd/sxhkdrc.common &
    run wallpaper.py &
    run xss-lock --transfer-sleep-lock -- betterlockscreen -l &
    # run picom --backend glx --xrender-sync-fence &
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
