#!/bin/bash

#Displaying some global environment variables:
echo $SHELL
echo $DISPLAY
echo $HOME
echo $PATH
echo $MANPATH
echo $PS1
echo $PS2
echo $USER
echo $TERM
echo $PWD

#Now we print script arguments, last return code, and shell PID.

echo $0
echo $1
echo $2
echo $3
echo $#
echo $$
echo $*
echo $@
echo $?
