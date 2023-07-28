#!/bin/sh

copyignore="/home/aarya/dotfiles/copyignore"

if ! [ -f $copyignore ]; then
  echo "ERROR"
  exit 1
fi

sudo rsync -aP --update \
  --exclude-from=/home/aarya/dotfiles/copyignore \
  --no-o --no-g \
  /home/aarya /mnt/aarya/backup

gpg --export | sudo tee /mnt/aarya/public.key >/dev/null
gpg --export-secret-key | sudo tee /mnt/aarya/private.key >/dev/null

