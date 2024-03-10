#!/bin/sh
source /home/aarya/pyvenv/bin/activate

killall -q lemonbar
while pgrep -u $UID -x lemonbar >/dev/null; do sleep 1; done

/home/aarya/.config/lemonbar/lemonconfig.py | \
    lemonbar -p -g x24++ \
    -F#ffffff -B#222222 -U#268BD2 -u 2 \
    -f "Hack Nerd Font:size=9.0" \
    -f "Font Awesome 6 Free"  \
    -f "Font Awesome 6 Brands" \
    -f "Font Awesome 6 Free Solid" \
    | /home/aarya/.config/lemonbar/lemonhandler.py
