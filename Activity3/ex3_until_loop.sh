#!/bin/bash

# Ask for a valid directory using an until loop
until [ -d "$dir" ]; do
    read -p "Enter a valid directory path: " dir
    if [ ! -d "$dir" ]; then
        echo "Invalid directory. Please try again."
    fi
done

# Show permissions
permissions=$(stat -c "%A" "$dir")
echo "Permissions: $permissions"

# Count files and subfolders (excluding the directory itself)
num_files=$(find "$dir" -maxdepth 1 -type f | wc -l)
num_dirs=$(find "$dir" -mindepth 1 -maxdepth 1 -type d | wc -l)

echo "Number of files: $num_files"
echo "Number of subdirectories: $num_dirs"

# List contents
echo "Contents of '$dir':"
for item in "$dir"/*; do
    echo "$(basename "$item")"
done
