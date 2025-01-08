#!/usr/bin/env python3

from plexapi.server import PlexServer
import subprocess

PLEX_URL = "https://plex.aaryab.in"
PLEX_TOKEN = "ArGEEtMdeSQvMrYosdex"

plex = PlexServer(PLEX_URL, PLEX_TOKEN)

for p in plex.playlists():
    local_playlist_file = "/home/aarya/playlists/Plex " + p.title + ".m3u"
    print(local_playlist_file)
    track_list = []
    for track in p.items():
        filename = track.media[0].parts[0].file
        local_filename = filename.replace("/data/library/Music", "/home/aarya/Music")
        track_list.append(local_filename)
    print(f"Got {len(track_list)} songs from playlist {p.title}")
    with open(local_playlist_file, "w") as file:
        file.write("\n".join(track_list))


