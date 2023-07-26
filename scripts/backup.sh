#!/bin/sh
# Add or remove directories from this list.
directories=(
"$HOME/Desktop"
"$HOME/Documents"
"$HOME/Downloads"
"$HOME/GoogleDrive"
"$HOME/Backup"
"$HOME/OneDrive"
"$HOME/Library"
"$HOME/screenshots"
"$HOME/Pictures"
"$HOME/repos"
"$HOME/dotfiles"
"$HOME/diskimages"
"$HOME/.config"
"$HOME/.local"
"$HOME/.ssh"
"$HOME/.gnupg"
"$HOME/.password-store"
"$HOME/.thunderbird"
)

copyignore="/home/aarya/dotfiles/copyignore"

if ! [ -f $copyignore ]; then
  echo "No such file: $copyignore"
  exit 1
fi

destination="$HOME/backup_$(date +%Y-%m-%d)"
mkdir -p $destination

opts="-aP --update --exclude-from=$copyignore --include=.git/"

echo "Copying files..."
for directory in "${directories[@]}"; do
  rsync $opts $directory $destination
done

echo "Exporting gpg keys..."
gpg --export > $destination/public.key
gpg --export-secret-key > $destination/private.key

echo "Creating tar file..."
tarfile=$destination.tar.gz
tar -cvzf $tarfile $destination
echo "Removing temp folder..."
echo "Backup created at $tarfile"

read -p "Remove temp folder: ${destination} [y/n]: " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  /bin/rm -rf $destination
fi
