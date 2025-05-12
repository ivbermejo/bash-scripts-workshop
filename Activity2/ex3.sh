#!/bin/bash

# Ask the user to enter an integer
read -p "Enter an integer: " num

# Check if the number is zero
if [ "$num" -eq 0 ]; then
    echo "The number is zero."
else
    echo "The number is not zero."
fi