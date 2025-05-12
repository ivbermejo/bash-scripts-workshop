#!/bin/bash

# Check that a path is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path>"
    exit 1
fi

path="$1"

if [ -d "$path" ]; then
    echo "It is a directory."
elif [ -f "$path" ]; then
    echo "It is a file."
    # Extract and show the file extension
    ext="${path##*.}"
    if [ "$ext" != "$path" ]; then
        echo "Extension: $ext"
    else
        echo "The file has no extension."
    fi
else
    echo "Error: Path does not exist or is not a regular file/directory."
fi