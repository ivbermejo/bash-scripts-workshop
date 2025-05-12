#!/bin/bash

# Check if exactly one parameter (file path) is passed
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file_path="$1"

# Check if the file exists
if [ ! -e "$file_path" ]; then
    echo "Error: File '$file_path' does not exist."
    exit 1
fi

# a) Display file type using 'file' command
file_type=$(file --brief "$file_path")
echo "File type: $file_type"

# b) Check permissions
[ -r "$file_path" ] && echo "The file is readable."
[ -w "$file_path" ] && echo "The file is writable."
[ -x "$file_path" ] && echo "The file is executable."