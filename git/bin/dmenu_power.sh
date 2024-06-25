#!/bin/sh

logout() {
	killall redshift

	pgrep -x xfce4-session && xfce4-session-logout --logout && exit 0
	pgrep -x bspwm && bspc quit && exit 0
	pgrep -x i3 && i3-msg "exit" && exit 0
	pgrep -x dwm && stopdwm && exit 0

    pkill -f xinit
}

items="lock
exit
poweroff
reboot
"

case $(printf '%s' "$items" | dmenu -i) in
	lock) xautolock -locknow ;;
	exit|logout) logout ;;
	# sleep|suspend) systemctl suspend ;;
	# hibernate) systemctl hibernate ;;
	# hybrid|hybrid-sleep) systemctl hybrid-sleep ;;
	reboot) systemctl reboot ;;
	poweroff|shutdown) systemctl poweroff ;;
	*) exit 1 ;;
esac
