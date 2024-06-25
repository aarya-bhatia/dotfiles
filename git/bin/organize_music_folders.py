#!/usr/bin/env python3
import os
import sys

MUSIC_DIR = "/home/aarya/Media/Music"
if not os.path.exists(MUSIC_DIR):
    print("file not found: ", MUSIC_DIR)
    exit(1)


def get_music_folders():
    folders = map(lambda f: os.path.join(MUSIC_DIR, f), os.listdir(MUSIC_DIR))
    folders = filter(os.path.isdir, folders)
    folders = list(folders)
    return folders


def combine_artists(folders):
    for folder in folders:
        tokens = folder.split(" - ")
        if (len(tokens) != 2):
            print("illegal folder: ", folder)
            continue

        artists = tokens[0].split(",")
        album = tokens[1].strip()

        if (len(artists) == 1):
            continue

        primary = artists[0].strip()
        new_path = f"{primary} - {album}"
        new_path = os.path.join(MUSIC_DIR, new_path)
        if not os.path.exists(new_path):
            print("created dir: ", new_path)
            os.mkdir(new_path)

        song_files = os.listdir(folder)
        for song_file in song_files:
            if (song_file.endswith(".mp3")):
                old_song_path = os.path.join(folder, song_file)
                new_song_path = os.path.join(new_path, song_file)
                os.rename(old_song_path, new_song_path)
                print(f"To move file from {old_song_path} to {new_song_path}\n")


def remove_empty_dirs(folders):
    for folder in folders:
        if (len(os.listdir(folder)) == 0):
            print('removed empty folder: ', folder)
            os.rmdir(folder)


def get_artist_map(folders):
    artists = {}

    for folder in folders:
        filename = os.path.basename(folder)
        tokens = filename.split(" - ")
        if (len(tokens) != 2):
            continue

        artist = tokens[0].strip()
        album = tokens[1].strip()

        if artist not in artists:
            artists[artist] = []

        artists[artist].append((album, folder))

    return artists


def make_subdirs():
    folders = get_music_folders()
    artists = get_artist_map(folders)

    for artist, albums in artists.items():
        artist_path = os.path.join(MUSIC_DIR, artist)
        if not os.path.exists(artist_path):
            os.mkdir(artist_path)

        for album, old_album_path in albums:
            new_album_path = os.path.join(artist_path, album)
            os.rename(old_album_path, new_album_path)
            print(f'Album created: {album} by {artist}')


if __name__ == "__main__":
    make_subdirs()
