#!/bin/sh

start() {
	source /home/aarya/pyvenv/bin/activate
	make
	/home/aarya/.config/lemonbar/bin/main | lemonbar -b -p -g x25++ \
		-F#ffffff -B#222222 -U#268BD2 -u 2 \
		-f "Hack Nerd Font:size=9.5" \
		-f "Font Awesome 6 Free"  \
		-f "Font Awesome 6 Brands" \
		-f "Font Awesome 6 Free Solid" |
		while read line; do
			$line &
		done
}

killall -q lemonbar
start &
echo "lemonbar launched..."
