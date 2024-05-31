#!/bin/bash

# Run command in background unless already running...
run() {
  if ! pgrep -f "$1"; then
    $@&
  fi
}

# turn on numlock
numlockx on &

# launch dwmblocks
run dwmblocks &

# set wallpaper to last used
$HOME/scripts/wallpaper.py &

# start notification daemon
run dunst &

# start session manager
run lxsession &

# start music player daemon
run mpd &

 # start compositor
run picom --backend glx --xrender-sync-fence &

# start simple X hotkey daemon
run sxhkd -c $HOME/.config/sxhkd/sxhkdrc.common &

# start nightlight with location services
run nightlight.sh auto &

# screen locker
run xss-lock --transfer-sleep-lock -- betterlockscreen -l &

# power manager
run xfce4-power-manager &
