#!/bin/bash

while true; do
    read -s -p "Enter a password: " pass
    echo

    if [[ ${#pass} -lt 8 ]]; then
        echo "Password must be at least 8 characters."
    elif [[ ! "$pass" =~ [A-Z] ]]; then
        echo "Password must contain at least one uppercase letter."
    elif [[ ! "$pass" =~ [0-9] ]]; then
        echo "Password must contain at least one digit."
    else
        echo "Password accepted."
        break
    fi
done
