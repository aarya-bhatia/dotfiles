#!/bin/sh
# Add or remove directories from this list.
directories=(
"$HOME/Desktop"
"$HOME/Documents"
"$HOME/Downloads"
"$HOME/GoogleDrive"
"$HOME/OneDrive"
"$HOME/repos"
"$HOME/screenshots"
"$HOME/Pictures"
"$HOME/MacBookProBackup"
"$HOME/.config"
"$HOME/.ssh"
"$HOME/.gnupg"
"$HOME/.password-store"
)

copyignore="/home/aarya/dotfiles/copyignore"

if ! [ -f $copyignore ]; then
  echo "No such file: $copyignore"
  exit 1
fi

destination="$HOME/backup_$(date +%Y-%m-%d)"
mkdir -p $destination

echo "Copying files..."
for directory in "${directories[@]}"; do
  rsync -aP --update --exclude-from=$copyignore $directory $destination
done

echo "Exporting gpg keys..."
gpg --export > $destination/public.key
gpg --export-secret-key > $destination/private.key

echo "Creating tar file..."
tarfile=$destination.tar.gz
tar -cvzf $tarfile $destination
echo "Removing temp folder..."
/bin/rm -rf $destination

echo "Backup created at $tarfile"

