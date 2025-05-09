#!/bin/bash

# Ask user for filename
read -p "Enter the filename to save the words: " filename

# Check if the file exists, if not, create it
if [ ! -f "$filename" ]; then
    touch "$filename"
    echo "File created: $filename"
fi

echo "Start typing words (type ':>' to finish):"

while true; do
    read word
    if [ "$word" == ":>" ]; then
        break
    fi
    echo "$word" >> "$filename"
done

echo "Words saved to $filename"
