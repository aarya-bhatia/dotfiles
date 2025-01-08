#!/usr/bin/env bash

PLAYLIST_NAME=favorites
if ! mpc playlist $PLAYLIST_NAME | grep -qFx "`mpc current`"; then
     mpc -f %file% current | mpc addplaylist $PLAYLIST_NAME
     echo "Added current song to $PLAYLIST_NAME playlist."
else
    echo "Current song is already in playlist $PLAYLIST_NAME"
fi

