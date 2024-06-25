#!/bin/sh

choice=$(fd . --extension pdf $HOME | dmenu -l 20)
[ -f "$choice" ] && exec zathura "$choice"

