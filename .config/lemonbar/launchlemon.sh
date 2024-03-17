#!/bin/sh
source /home/aarya/pyvenv/bin/activate
make
pkill -2 -x launchlemon.sh
bin/main | lemonbar -b -p -g x24++ \
    -F#ffffff -B#222222 -U#268BD2 -u 2 \
    -f "Hack Nerd Font:size=9.5" \
    -f "Font Awesome 6 Free"  \
    -f "Font Awesome 6 Brands" \
    -f "Font Awesome 6 Free Solid"
