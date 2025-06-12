#!/bin/bash
#Create a Bash script that displays the following information:
#Ask for the name of a main global variable (i. e., HOME, USER, SHELL, PWD, PATH).
#After that, show the arguments passed to the script at execution time.
#In every case, show the return value of the last executed command ($?).
#By last, show the PID of the current Shell ($$).

echo "Name a global variable:"
read nom 
echo $@
echo ${!nom} 
echo $?
echo $$