#!/bin/bash

exec &>/dev/null

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
