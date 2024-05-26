#!/bin/bash

# Run command in background unless already running...
run() {
  if ! pgrep -f "$1"; then
    $@&
  fi
}

start_tmux_session() {
  source ~/scripts/tmux_manager.sh
  # fetch mail
  TmuxAdd system mail "~/scripts/mailcheck.sh"
  # start nightlight with location services
  TmuxAdd system nightlight "~/scripts/nightlight.sh auto"
  # TmuxAdd system lemonbar "~/repos/lemons/startlemon"
}

# set cursor style
xsetroot -cursor_name left_ptr &

# turn on numlock
numlockx on &

# set wallpaper to last used
~/scripts/wallpaper.py &

# start notification daemon
run dunst &

# start session manager
run lxsession &

# start music player daemon
run mpd &

 # start compositor
run picom --backend glx --xrender-sync-fence &

# start simple X hotkey daemon
run sxhkd -c ~/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc.common &

# start screen locker
run xss-lock --transfer-sleep-lock -- betterlockscreen -l &

# power management
run xfce4-power-manager &

# mirror screen to monitor
xrandr | grep -q "HDMI-1 connected" && ~/.screenlayout/mirror.sh &

# launch panel
~/.config/polybar/launch.sh &

start_tmux_session &
