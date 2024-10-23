#!/bin/sh

PICTURES_FILE=~/.pictures
WALLPAPER_FILE=~/.wallpaper

if [ ! -f $PICTURES_FILE ]; then
    echo Missing $PICTURES_FILE file
    exit 1
fi

OPENER=${1:-nsxiv}

[ -f $WALLPAPER_FILE ] && old_wallpaper=$(tail -1 $WALLPAPER_FILE)

sel=$(cat $PICTURES_FILE | dmenu -i -l 20)
[ -n "$sel" ] && $OPENER "$sel"

[ -f $WALLPAPER_FILE ] &&  new_wallpaper=$(tail -1 $WALLPAPER_FILE)

if ! [ -z "$old_wallpaper" -o -z "$new_wallpaper" ]; then
    if [ "$old_wallpaper" != "$new_wallpaper" ]; then
        echo wallpaper changed...
        betterlockscreen -u "$(tail -1 $WALLPAPER_FILE)"
    else
        echo wallpaper not changed...
    fi
fi
