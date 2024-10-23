#!/bin/sh

# TODO
# sel=$(cat $HOME/.abook/addressbook | grep ^email= | sed "s/email=//" | sed "s/,/\n/g" | dmenu -l 20)

sel=$(echo -e "aarya.bhatia1678@gmail.com\naarya.bhatia6@gmail.com\naaryab2@illionis.edu\naaryab@amazon.com" | dmenu -l 20)
[ -n "$sel" ] && xdotool type "$sel"

