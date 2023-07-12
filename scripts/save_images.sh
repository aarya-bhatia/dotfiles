#!/bin/bash
#
# We can pipe this command to "meh" image viewer
# It will "bookmark" the selected images when we press ENTER
# by copying the file to the destination folder

# Destination directory
destination="$HOME/Pictures/saved/"
mkdir -p $destination

# Function to check if a file is a valid image file
is_image_file() {
  file "$1" | grep -qE 'image|bitmap'
}

# Read filenames from stdin and process each file
while IFS= read -r filename; do
  if [ -f "$filename" ] && is_image_file "$filename" ; then
    cp "$filename" "$destination"
    echo "Copied file: $filename"
  else
    echo "Invalid or non-image file: $filename"
  fi
done

