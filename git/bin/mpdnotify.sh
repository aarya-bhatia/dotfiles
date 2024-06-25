#!/bin/sh

while true; do
	song = $(mpc current --wait)
	[ -z "$song" ] && exit
	notify-send "Now playing" "$song"
done
