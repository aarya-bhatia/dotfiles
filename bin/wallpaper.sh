#!/bin/sh

# file=~/Wallpapers/0170.jpg
# file=~/Wallpapers/0359.jpg
file=~/Wallpapers/0212.jpg

if [ ! -f "$file" ]; then
    file="$(find ~/Wallpapers/ -type f | sort -R | head -1)"
fi

xwallpaper --stretch "$file"
