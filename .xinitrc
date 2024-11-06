#!/bin/bash

exec &>/dev/null

#get gnome-keyring running
dbus-update-activation-environment --all
gnome-keyring-daemon --start --components=secrets

session="${2:-i3}"

case "$session" in
    dwm)        exec startdwm;;
    bspwm)      exec bspwm;;
    i3)         exec i3;;
    xfce)       exec startxfce4;;
    cinnamon)   exec cinnamon-session;;
    lxde)       exec lxsession;;
    *)          exec $session;;
esac
