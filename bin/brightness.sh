#!/bin/sh

BRIGHTNESS_DELTA=10

get_brightness() {
	curval=$(brightnessctl get)
	maxval=$(brightnessctl max)
	percent=$(echo "100*$curval/$maxval" | bc)
	printf "%.0f%%\n" $percent
}

show_brightness_notif() {
	ID_file=/tmp/brightness_notif_id

	if [ -f $ID_file ]; then
		ID=$(cat $ID_file)
		notify-send -r "$ID" "brightness: $(get_brightness)"
	else
		ID=$(notify-send -p "brightness: $(get_brightness)")
		echo $ID > $ID_file
	fi
}

panel_update_brightness() {
	pgrep -x polybar && polybar-msg action my_brightness hook 0
}

case "$1" in
	get) get_brightness ;;

	set) brightnessctl set "$2%" ;;

	up) brightnessctl set +${BRIGHTNESS_DELTA}%
		panel_update_brightness
		show_brightness_notif ;;

	down) brightnessctl set ${BRIGHTNESS_DELTA}%-
		panel_update_brightness
		show_brightness_notif ;;
esac
