#!/bin/bash

# echo $(uname -n -r) Vol:$(sb-volume) Mem:$(sb-memory) Bat:$(sb-battery) $(sb-disk) Temp:$(sb-weather) $(sb-mpd) $(sb-date)

echo -e "$(sb-mpd) |  $(sb-volume) | 󰍛 $(sb-memory) | $(sb-battery) |  $(sb-weather 2>/dev/null) | $(sb-date)"
