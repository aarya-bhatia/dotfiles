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
$HOME/.config/polybar/bspwm_launch.sh &

# setup keyboard mappings
$HOME/scripts/keymaps.sh &

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
run sxhkd -c $HOME/.config/sxhkd/sxhkdrc $HOME/.config/sxhkd/sxhkdrc.common &

# start nightlight with location services
run ~/scripts/nightlight.sh auto &

# start screen locker
run xss-lock --transfer-sleep-lock -- i3lock --nofork --ignore-empty-password --no-unlock-indicator --color=505050 &

# power management
run xfce4-power-manager --daemon &

# clipboard manager
run clipmenud &

# mirror screen to monitor
xrandr | grep -q "HDMI-1 connected" && $HOME/.screenlayout/mirror.sh &

# $HOME/.screenlayout/horizontal.sh &
