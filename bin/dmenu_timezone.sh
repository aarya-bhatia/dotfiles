#!/bin/sh


option=$(printf "US/Central\nUS/Eastern\nUS/Pacific\nUTC\nAsia/Kolkata\n" | dmenu -i)
[ -n "$option" ] && timedatectl set-timezone "$option" && notify-send "Timezone" "$(timedatectl)"

