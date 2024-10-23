#!/bin/sh

VOLUME_DELTA=10

get_volume() {
	pamixer --get-volume-human
}

show_volume_notif() {
	ID_file=/tmp/volume_notif_id

	if [ -f $ID_file ]; then
		ID=$(cat $ID_file)
		notify-send -r "$ID" "volume: $(get_volume)"
	else
		ID=$(notify-send -p "volume: $(get_volume)")
		echo $ID > $ID_file
	fi
}

panel_update_volume() {
	pgrep -x polybar && polybar-msg action my_volume hook 0
	pgrep -x dwmblocks && pkill -RTMIN+10 dwmblocks
	pgrep -x i3blocks && pkill -SIGRTMIN+5 i3blocks
}

case "$1" in
	get) get_volume ;;

	set) pamixer --set-volume "$2"
		panel_update_volume
		show_volume_notif ;;

	up) pamixer --allow-boost -i ${VOLUME_DELTA}
		panel_update_volume
		show_volume_notif ;;

	down) pamixer --allow-boost -d ${VOLUME_DELTA}
		panel_update_volume
		show_volume_notif ;;

	mute) pamixer --toggle-mute
		panel_update_volume
		show_volume_notif ;;
esac

