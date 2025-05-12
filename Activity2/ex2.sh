#!/bin/bash

# Ask the user to enter an integer
read -p "Enter an integer: " num

# Check if the number is negative
if [ "$num" -lt 0 ]; then
    echo "The number is negative."
else
    echo "The number is not negative."
fi