#!/bin/bash

# Alright, Echo command  to prompt the user to give us the name of a program
# Save it to a variable to use in our command
echo "Hey User Supreme! What progam are you wondering it's running?: "
read program

# 'pgrep' searches for a process by name, id, or other classifer
# '-x' flag ensures an exact match to the process name given
# '>/dev/null' throws the output of pgrep to the endless abyss that is the Null Void, stopping the pgrep output from printing to the terminal; we only want our echo statements to print
# we counch this in an if/else statement so that one statement prints if the program is running, and a negative statement prints if it is not running
if pgrep -x $program > /dev/null; then
	echo "User...$program is running!!"
else
	echo "User...$program has stopped!!"
fi

