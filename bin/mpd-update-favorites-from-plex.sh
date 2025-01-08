#!/usr/bin/env bash
set -e
~/bin/python-scripts/list_plex_favorite_tracks.py 2>/dev/null | tee -a ~/playlists/favorites.m3u
sort -u ~/playlists/favorites.m3u > tmp && mv tmp ~/playlists/favorites.m3u

