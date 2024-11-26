#!/bin/bash
shopt -s nocasematch

empty_files=$(find . -type f -empty)
empty_dirs=$(find . -type d -empty)
empty_items="$empty_files
$empty_dirs"

echo "the following empty files were found: $empty_files"
sleep 2
echo "the following empty directories were found: $empty_dirs"

read -p "Do you want to delete these empty files and directories? (Y/N): " delete

if [[ "$delete" == [Y] ]]; then
	echo "$empty_items" | while read -r item; do
		if [ -e "$item" ]; then
			rm -rf "$item"
			echo "deleted: $item"
		else
			echo "No such file or directory exists: $item"
		fi
	done
else
	echo "no file or directories were deleted"
fi

