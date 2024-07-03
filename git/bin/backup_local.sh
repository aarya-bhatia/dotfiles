#!/bin/bash
DEST=/mnt/$(uname -n)/
read -p "backup to $DEST? [y/n]: " ans
[ "$ans" != "y" ] && exit 1

sudo mkdir -p $DEST

echo "Backing up Home files to $DEST..."
/bin/rsync -av --delete --update --no-links \
	--exclude='*cache*' \
	--exclude='*node_modules*' \
	--exclude='*__pycache__*' \
	--exclude='*Media*' \
	$HOME/ $DEST/

echo "Backing up Media files to /mnt/Media..."
/bin/rsync -av $HOME/Media/ /mnt/Media/

echo "Backup created in $DEST"
