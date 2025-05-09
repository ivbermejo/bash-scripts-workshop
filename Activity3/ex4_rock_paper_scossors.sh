#!/bin/bash

echo "Rock, Paper, Scissors - Play against the machine!"

while true; do
    read -p "Choose rock, paper, scissors or type 'exit' to quit: " user
    user=$(echo "$user" | tr '[:upper:]' '[:lower:]')

    if [ "$user" == "exit" ]; then
        echo "Game over."
        break
    fi

    if [[ ! "$user" =~ ^(rock|paper|scissors)$ ]]; then
        echo "Invalid choice. Try again."
        continue
    fi

    options=("rock" "paper" "scissors")
    machine=${options[$RANDOM % 3]}
    echo "Machine chose: $machine"

    if [ "$user" == "$machine" ]; then
        echo "It's a draw."
    elif [[ "$user" == "rock" && "$machine" == "scissors" ]] ||
         [[ "$user" == "paper" && "$machine" == "rock" ]] ||
         [[ "$user" == "scissors" && "$machine" == "paper" ]]; then
        echo "You win!"
    else
        echo "You lose!"
    fi
done
