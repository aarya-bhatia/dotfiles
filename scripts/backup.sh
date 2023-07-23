#!/bin/sh
# Add or remove directories from this list.
directories=(
"$HOME/Desktop"
"$HOME/Documents"
"$HOME/Downloads"
"$HOME/GoogleDrive"
"$HOME/OneDrive"
"$HOME/Library"
"$HOME/screenshots"
"$HOME/Pictures"
"$HOME/MacBookProBackup"
"$HOME/repos"
"$HOME/dotfiles"
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

opts="-aP --update --exclude-from=$copyignore --include=.git/"

echo "Copying files..."
for directory in "${directories[@]}"; do
  rsync $opts $directory $destination
done

echo "Exporting gpg keys..."
gpg --export > $destination/public.key
gpg --export-secret-key > $destination/private.key

# echo "Backing up git repos..."
# repo_directory=$HOME/repos
# mkdir -p ${destination}/repos
#
# cd "$HOME/dotfiles" && git archive --format=tar.gz --output="${destination}/dotfiles.tar.gz" HEAD
#
# # Find all the git repositories and perform the backup
# find "${repo_directory}" -type d -name ".git" | while read -r git_directory; do
#     repo_directory=$(dirname "${git_directory}")
#
#     # Move to the repository directory
#     cd "${repo_directory}" || exit
#
#     # Get the repository name
#     repo_name=$(basename "${repo_directory}")
#
#     # Create the backup file path
#     backup_file="${destination}/repos/${repo_name}.tar.gz"
#
#     # Run "git archive" and save the output as a tar file
#     git archive --format=tar.gz --output="${backup_file}" HEAD
#
#     echo "Backup created for ${repo_name}"
# done

echo "Creating tar file..."
tarfile=$destination.tar.gz
tar -cvzf $tarfile $destination
echo "Removing temp folder..."
echo "Backup created at $tarfile"

read -p "Remove temp folder: ${destination} [y/n]: " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  /bin/rm -rf $destination
fi
