#!/bin/sh

wpfile=/home/aarya/.wallpaper
file=/home/aarya/Wallpapers/0328.jpg

if [ -f $wpfile ]; then
    echo found wallpaper file: $wpfile
    file=$(tail -1 $wpfile)
fi

if [ ! -f "$file" ]; then
    file="$(find ~/Wallpapers/ -type f | sort -R | head -1)"
fi

echo setting wallpaper to: $file
xwallpaper --stretch "$file"
