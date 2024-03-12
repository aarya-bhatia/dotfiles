#!/bin/sh
set -e
source /home/aarya/pyvenv/bin/activate
pkill -f launchlemon
python3 /home/aarya/.config/lemonbar/lemonconfig.py | \
    lemonbar -p -g x24++ \
    -F#ffffff -B#222222 -U#268BD2 -u 2 \
    -f "Hack Nerd Font:size=9.5" \
    -f "Font Awesome 6 Free"  \
    -f "Font Awesome 6 Brands" \
    -f "Font Awesome 6 Free Solid" \
    | python3 /home/aarya/.config/lemonbar/lemonhandler.py
