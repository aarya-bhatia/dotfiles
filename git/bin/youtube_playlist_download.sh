#!/bin/sh
if [ -z $1 ]; then
	printf "Usage: %s <playlist_url>\n" $0
	exit 1
fi

yt-dlp --download-archive archive.txt -x --audio-format mp3 -o "%(artist)s/%(album)s/%(playlist_index)s - %(title)s.%(ext)s" $1

