#!/bin/bash

# Check if the number of parameters is exactly 3
if [ "$#" -ne 3 ]; then
    echo "Error: You must pass exactly 3 parameters."
    exit 1
fi

echo "Correct number of parameters provided."