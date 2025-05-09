#!/bin/bash

# Initialize counters
positive=0
negative=0
zero=0
invalid=0

# Loop through all script parameters
for num in "$@"; do
    # Validate if it's a number using regex
    if [[ "$num" =~ ^-?[0-9]+$ ]]; then
        if [ "$num" -gt 0 ]; then
            ((positive++))
        elif [ "$num" -lt 0 ]; then
            ((negative++))
        else
            ((zero++))
        fi
    else
        echo "Warning: '$num' is not a valid integer."
        ((invalid++))
    fi
done

# Display results
echo "Positive numbers: $positive"
echo "Negative numbers: $negative"
echo "Zeros: $zero"
echo "Invalid inputs: $invalid"
