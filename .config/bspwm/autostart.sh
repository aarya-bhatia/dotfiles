#!/bin/bash

# Run command in background unless already running...
run() {
  if ! pgrep -f "$1"; then
    $@&
  fi
}

# set cursor style
xsetroot -cursor_name left_ptr &

# turn on numlock
numlockx on &

# launch polybar
~/.config/polybar/launch.sh &

# set wallpaper to last used
~/scripts/wallpaper.py &

# start notification daemon
# run dunst &

# start session manager
run lxsession &

# start music player daemon
run mpd &

 # start compositor
run picom --backend glx --xrender-sync-fence &

# start simple X hotkey daemon
run sxhkd -c ~/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc.common &

# start nightlight with location services
run ~/scripts/nightlight.sh auto &

# start screen locker
run xss-lock --transfer-sleep-lock -- betterlockscreen -l &

# power management
run xfce4-power-manager &

# mirror screen to monitor
xrandr | grep -q "HDMI-1 connected" && ~/.screenlayout/mirror.sh &

# mail sync
run ~/scripts/mailsync.sh &>>$HOME/.log &
