#!/bin/bash

while true; do
    echo "Menu:"
    echo "1) Show current date and time"
    echo "2) Check if a file exists"
    echo "3) Exit"
    read -p "Select an option [1-3]: " opt

    case $opt in
        1)
            date
            ;;
        2)
            read -p "Enter file name or path: " file
            if [ -e "$file" ]; then
                echo "The file exists."
            else
                echo "File not found."
            fi
            ;;
        3)
            echo "Goodbye."
            break
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
