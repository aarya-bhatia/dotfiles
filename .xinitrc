#!/bin/sh

arg=${2:-bspwm}

case $session in
    dwm)        session=startdwm;;
    i3|i3wm)    session=i3;;
    xfce|xfce4) session=xfce4-session;;
    bspwm)      session=bspwm;;
    cinnamon)   session=cinnamon-session;;
    *)          session=$arg;;
esac

logfile=~/.xinit.log
echo starting session: $session
echo log file: $logfile
exec $session &>>$logfile
# exec dbus-run-session -- $session &>>$logfile
