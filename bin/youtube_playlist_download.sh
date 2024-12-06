#!/bin/sh
if [ -z $1 ]; then
	printf "Usage: %s <playlist_url>\n" $0
	exit 1
fi

yt-dlp -f 'bestaudio' --extract-audio --audio-format flac --audio-quality 0 -o "%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" "$1"

