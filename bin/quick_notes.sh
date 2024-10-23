#!/bin/bash

NOTES_DIR=$HOME/Notes
Filename=$(echo ${NOTES_DIR}/$(date +'%Y-%m-%d_%H%M%S').md)
touch $Filename
${TERMINAL:-alacritty --class=floating} -e ${EDITOR:-vim} $Filename
size=$(du -b $Filename | cut -f1)
if [ "$size" -gt 0 ]; then
    notify-send "Note saved to ${Filename}"
else
    rm $Filename
fi

