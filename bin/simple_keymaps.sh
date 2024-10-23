#!/bin/sh

# Reset to defaults
setxkbmap -layout us -option

setxkbmap -option 'caps:ctrl_modifier' -option 'altwin:swap_alt_win'

# Run xcape to make CapsLock act as Escape when pressed and released alone
# xcape -e 'Caps_Lock=Escape' &

