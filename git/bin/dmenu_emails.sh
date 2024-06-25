#!/bin/sh

# TODO
sel=$(cat $HOME/.abook/addressbook | grep ^email= | sed "s/email=//" | sed "s/,/\n/g" | dmenu -l 20)
[ -n "$sel" ] && xdotool type "$sel"
