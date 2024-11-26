#!/bin/bash

echo "Here is a list of all running processes!"

ps -ef

read -p "Which program would you like to kill? Please give me the PID, and I will end it, sire.: " kill

if ps -p $kill; then
	kill $kill
	echo "$kill is no more, sire."
else 
	echo "But it does not live, sire."
fi
