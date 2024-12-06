#!/bin/bash

exec &>/dev/null

dbus-update-activation-environment --all
gnome-keyring-daemon --start --components=secrets

session="${2:-dwm}"

xset s off
xset dpms 0 0 1800

case "$session" in
    dwm)        exec startdwm;;
    bspwm)      exec bspwm;;
    i3)         exec i3;;
    xfce)       exec startxfce4;;
    cinnamon)   exec cinnamon-session;;
    lxde)       exec lxsession;;
    *)          exec $session;;
esac
