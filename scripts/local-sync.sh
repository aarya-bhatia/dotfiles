#!/bin/bash

default_path=/media/aarya/Aarya

read -p "Enter remote path [$default_path]:" user_path

if [ -z "$user_path" ]; then
    path=$default_path
else
    path=$user_path
fi

name="Backup"

if [[ $path == */ ]]; then
    backup_path="$path$name"
else
    backup_path="$path/$name"
fi

echo "Backup folder: $backup_path"

# Defaults paths to backup
paths=(
    "$HOME/OneDrive"
    "$HOME/GoogleDrive"
    "$HOME/repos"
)

# Array to store selected paths
selected_paths=()

# Iterate over each path
for path in "${paths[@]}"; do
  # Prompt user for inclusion/exclusion
  read -p "Include path '$path'? [y/n]: " choice

  # Check user's choice
  if [[ $choice == [yY] ]]; then
    # Add path to selected paths array
    selected_paths+=("$path")
  fi
done

if [ ${#selected_paths[@]} -eq 0 ]; then
    echo "No paths selected."
    exit 0
fi

# Print the selected paths
echo "Backing up the following directories:"
for path in "${selected_paths[@]}"; do
  echo "$path"
done

if command -v rsync &> /dev/null; then
    rsync -ahvL --ignore-existing --update --exclude-from=$HOME/.copyignore \
        "${selected_paths[@]}" $backup_path 
else
    echo "Please install rsync and retry the backup."
fi

