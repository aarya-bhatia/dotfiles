#!/bin/sh
session=${2:-bspwm}
case $session in
    dwm)        while true; do ~/.dwm/autostart.sh; dwm; done;;
    i3|i3wm)    exec i3;;
    xfce|xfce4) exec xfce4-session;;
    bspwm)      exec bspwm;;
    cinnamon)   exec cinnamon-session;;
    *)          exec $arg;;
esac
