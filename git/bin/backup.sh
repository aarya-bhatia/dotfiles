#!/bin/sh
rsync -aP $HOME/Media/ home:/mnt/Media/
rsync -aP --delete $HOME/cloud/ home:/mnt/files/
rsync -aP --delete $HOME/git/ home:/mnt/git/
rsync -aP --delete --include=$HOME/.* home:/mnt/archlinux/
