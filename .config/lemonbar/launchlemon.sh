#!/bin/sh

start() {
	source /home/aarya/pyvenv/bin/activate
	cd /home/aarya/.config/lemonbar && make
	/home/aarya/.config/lemonbar/bin/main |
		while read line; do
			echo -e "%{S0}$line%{S1}$line"
		done |
		lemonbar -b -p -g x24++ \
		-F#ffffff -B#222222 -U#268BD2 -u 2 \
		-f "FreeMono:size=10" \
		-f "Font Awesome 6 Free"  \
		-f "Font Awesome 6 Brands" \
		-f "Font Awesome 6 Free Solid" |
		while read line; do
			$line &
		done
}

pkill -f /home/aarya/.config/lemonbar/bin/main
pkill -f /home/aarya/scripts/lemonbar
pkill -x lemonbar

start &
echo "lemonbar launched..."

