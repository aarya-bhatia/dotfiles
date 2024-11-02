#!/bin/sh
set -e
idevicepair list

# mkdir -p ~/.iPhone
# ifuse .iPhone

mkdir -p ~/.vlc
printf "mount vlc folder? [y/n]: "
read ans
[ "$ans" = 'y' ] && ifuse --documents org.videolan.vlc-ios ~/.vlc/

printf "check corrupted songs? [y/n]: "
read diff_check

MUSIC=~/Music
MOUNT=~/.vlc
printf "vlc mount point: $MOUNT [y/n]: "
read ans
[ "$ans" != 'y' ] && exit 1

find $MUSIC -type f -name "*.mp3" | while IFS= read -r file
do
  name=$(basename "$file");
  echo $name

  if [ ! -f "$MOUNT/$name" ]; then
    echo copying $name
    cp "$file" "$MOUNT/$name"
  fi

  if [ "$diff_check" = 'y' ]; then
    if ! diff "$file" "$MOUNT/$name"; then
      echo copying $name
      cp "$file" "$MOUNT/$name"
    fi
  fi
done


printf "Number of songs on iphone: %d\n" $(ls $MOUNT/*.mp3 | wc -l)

printf "unmount vlc folder? [y/n]: "
read ans
[ "$ans" = "y" ] && umount $MOUNT
