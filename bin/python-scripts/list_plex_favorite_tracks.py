#!/usr/bin/env python3

from plexapi.server import PlexServer
import subprocess

# Set your Plex server's URL and authentication token
PLEX_URL = "https://plex.aaryab.in"
PLEX_TOKEN = "ArGEEtMdeSQvMrYosdex"  # Replace with your Plex API token

# curl https://plex.aaryab.in/playlists?X-Plex-Token=ArGEEtMdeSQvMrYosdex
# curl https://plex.aaryab.in/playlists/19883/items?X-Plex-Token=ArGEEtMdeSQvMrYosdex

# Initialize the Plex server connection
plex = PlexServer(PLEX_URL, PLEX_TOKEN)


def get_favorite_track_filenames():
    ans = []

    for p in plex.playlists():
        if p.key == "/playlists/19883":
            for track in p.items():
                filename = track.media[0].parts[0].file
                local_filename = filename.replace(
                    "/data/library/Music", "/home/aarya/Music"
                )
                ans.append(local_filename)
                print(local_filename)

            break

    return ans


get_favorite_track_filenames()
