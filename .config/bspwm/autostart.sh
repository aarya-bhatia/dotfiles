#!/bin/bash

xsetroot -cursor_name left_ptr & # set cursor style
numlockx on # turn on numlock
~/.config/polybar/bspwm_launch.sh & # launch polybar
~/scripts/keymaps.sh & # setup keyboard mappings
~/scripts/wallpaper.py & # set wallpaper to last used

# start notification daemon
pgrep -f dunst || dunst &

# start session manager
pgrep -f lxsession || lxsession &

# start music player daemon
pgrep -f mpd || mpd &

pgrep -f picom || picom --backend glx --xrender-sync-fence & # start compositor

# start simple X hotkey daemon
pgrep -f sxhkd || sxhkd -c $HOME/.config/sxhkd/sxhkdrc $HOME/.config/sxhkd/sxhkdrc.common &

# start nightlight with location services
pgrep -f redshift || ~/scripts/nightlight.sh auto &

# start screen locker
pgrep -f xss-lock || xss-lock --transfer-sleep-lock -- i3lock --nofork --ignore-empty-password --no-unlock-indicator --color=505050 &

# power management
pgrep -f xfce4-power-manager || xfce4-power-manager --daemon &

# clipboard manager
pgrep -f clipmenud || clipmenud &

xrandr | grep -q "HDMI-1 connected" && /home/aarya/.screenlayout/mirror.sh &

# /home/aarya/.screenlayout/horizontal.sh &
