#!/bin/bash

# Check that a file path is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file="$1"

# Check if the file exists
if [ ! -e "$file" ]; then
    echo "Error: File does not exist."
    exit 1
fi

# Check permissions
[ -r "$file" ] && echo "Readable" || echo "Not readable"
[ -w "$file" ] && echo "Writable" || echo "Not writable"
[ -x "$file" ] && echo "Executable" || echo "Not executable"