#!/bin/bash

# Write a script to monitor the whole system for new bash files and when they are detected make them executable for the current user and let the user know.

Watch_dir=~

#find "$watch_dir" -type f -name "*.sh" -exec chmod +x [] \:

script_log="/tmp/old_scripts.txt"

if [[ ! -f "$script_log" ]]; then
	touch "$script_log"
fi

current_files=$(find "$Watch_dir" -type f -name "*.sh" | sort)

if [[ -s "$script_log" ]]; then
	old_files=$(cat "$script_log" | sort)
else
	old_files=""
fi

new_file=$(comm -13 <(echo "$old_files") <(echo "$current_files"))

if [[ -n "$new_file" ]]; then
	echo "$new_file" | while read -r file; do
		chmod +x "$file"
		echo "new Bash script detected and made executable: $file"
	done
fi

echo "$current_files" > "old_files"
