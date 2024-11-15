#!/bin/sh

# file=~/Wallpapers/0170.jpg
# file=~/Wallpapers/0359.jpg
# file=~/Wallpapers/0318.jpg
file=~/Wallpapers/0211.jpg

if [ ! -f "$file" ]; then
    file="$(find ~/Wallpapers/ -type f | sort -R | head -1)"
fi

xwallpaper --stretch "$file"
