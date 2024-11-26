#!/bin/bash

# set the file that will be analyzed by my script (source) and the file that the script will print the results to (destination)

source="/var/log/auth_log.log"
destination="suspicious_activity.log"

# creates an array for the keywords my script will anaylze the log file for in the loop

keywords=("Failed password" "Unauthorized access" "error: PAM: Authentication failure" "invalid user")

# Some echo statements for debugging purposes

echo "Script starting"
echo "log file path: $source"
echo "Output file path: $destination"

# Check if the log file exists

if [[ ! -f "$source" ]]; then
    echo "Log file does not exist."
    exit 1
fi

# IFS (internal field seperator) is set to " " here to ensure that the script reads every line in the file without any modifies or delimiters getting in the way

while ifs= read -r line
do
	echo "Processing line: $line"
	for keyword in "${keywords[@]}"
	do
		echo  "Checking keyword: $keyword" 
		if [[ $line == *"$keyword"* ]]; then
		  echo "Match found: $line"
		  echo "$line" >> "$destination"
		fi
	done
done < "$source" 

# the above loop will scan every line in the log_file for one of the keywords in the keyword array
# if the line = one of the keywords (the * ensures it will accept any of the keywords in the array) it will echo the line in the terimnal and output it to the output_file
# Ran into a hanging error because I didn't specify the input file at the end of the while loop. WHOOPS!

# And finally, I will schedule the script to run daily at midnight via a crontab command

(crontab -l 2>/dev/null; echo "0 0 * * * /GitPractice/log_analysis_script.sh") | crontab -
