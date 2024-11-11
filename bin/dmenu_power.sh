#!/bin/bash

logout() {
	pgrep -f dwm && stopdwm && exit 0
	pgrep -f xfce4-session && xfce4-session-logout --logout && exit 0
	pgrep -f bspwm && bspc quit && exit 0
	pgrep -f i3 && i3-msg "exit" && exit 0
    pkill -f xinit
}

case $(echo -e 'sleep\nlock\nexit\nrestart\nshutdown' | dmenu -i) in
	lock) lock.sh ;;
	exit) logout ;;
	sleep) systemctl suspend ;;
	restart) reboot ;;
	shutdown) poweroff ;;
	*) exit 1 ;;
esac
