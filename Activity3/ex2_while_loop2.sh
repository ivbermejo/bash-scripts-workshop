#!/bin/bash

# Get list of system usernames with at least one uppercase letter
users_with_uppercase=$(awk -F: '{if ($1 ~ /[A-Z]/) print $1}' /etc/passwd)

echo "System users with uppercase letters:"
echo "$users_with_uppercase"

# Ask user for a valid username
while true; do
    read -p "Enter a username from the list above: " input_user
    if echo "$users_with_uppercase" | grep -qx "$input_user"; then
        echo "Valid username entered."
        echo
        echo "User information:"
        getent passwd "$input_user"
        id "$input_user"
        finger "$input_user" 2>/dev/null || echo "Finger info not available."
        break
    else
        echo "Error: Username '$input_user' does not exist or has no uppercase letters."
    fi
done
