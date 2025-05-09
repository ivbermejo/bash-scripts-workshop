#!/bin/bash

values=()
count=0

# Keep asking until we get 3 valid integers
until [ "$count" -eq 3 ]; do
    read -p "Enter integer $((count + 1)): " num
    if [[ "$num" =~ ^-?[0-9]+$ ]]; then
        values+=("$num")
        count=$((count + 1))
    else
        echo "Invalid input. Please enter a valid integer."
    fi
done

# Calculate sum and product
sum=0
product=1
for n in "${values[@]}"; do
    sum=$((sum + n))
    product=$((product * n))
done

# Determine largest and smallest
max=${values[0]}
min=${values[0]}
for n in "${values[@]}"; do
    if [ "$n" -gt "$max" ]; then max=$n; fi
    if [ "$n" -lt "$min" ]; then min=$n; fi
done

echo "Sum: $sum"
echo "Product: $product"
echo "Largest value: $max"
echo "Smallest value: $min"
