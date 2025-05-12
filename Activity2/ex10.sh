#!/bin/bash

# a) Check if exactly 3 parameters were passed
if [ "$#" -ne 3 ]; then
    echo "Error: You must provide 3 parameters: operation operand1 operand2"
    exit 1
fi

op="$1"
num1="$2"
num2="$3"

# b) Check if num1 and num2 are valid integers
if ! [[ "$num1" =~ ^-?[0-9]+$ ]]; then
    echo "Error: '$num1' is not a valid integer."
    exit 1
fi

if ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
    echo "Error: '$num2' is not a valid integer."
    exit 1
fi

# c) Check if operation is valid and d) check division by zero
if [ "$op" = "add" ]; then
    result=$((num1 + num2))
elif [ "$op" = "subtract" ]; then
    result=$((num1 - num2))
elif [ "$op" = "multiply" ]; then
    result=$((num1 * num2))
elif [ "$op" = "divide" ]; then
    if [ "$num2" -eq 0 ]; then
        echo "Error: Cannot divide by zero."
        exit 1
    fi
    result=$((num1 / num2))
else
    echo "Error: Operation must be one of: add, subtract, multiply, divide"
    exit 1
fi

# e) Show result
echo "Result: $result"