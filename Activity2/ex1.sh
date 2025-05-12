#!/bin/bash

# Ask the user to enter an integer
read -p "Enter an integer: " num

# Check if the number is positive, negative, or zero
if [ "$num" -gt 0 ]; then
    echo "The number is positive."
elif [ "$num" -lt 0 ]; then
    echo "The number is negative."
else
    echo "The number is zero."
fi