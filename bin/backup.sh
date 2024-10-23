#!/bin/sh
rsync --exclude-from=/home/aarya/rsync-homedir-excludes.txt -aP --delete /home/aarya/ home:/mnt/files/

