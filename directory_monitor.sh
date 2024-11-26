w#!/bin/bash

# Ask the user for a directory to monitor
echo "Enter the directory you'd like to monitor:"
read directory

# Calculate the total size of the directory
# -s flag is used to get the summary size of the directory
# -h flag provides the output in human-readable format (e.g., 1K, 234M, 2G)
# cut -f1 takes only the first field (the size in this case) from the output
size=$(du -sh "$directory" | cut -f1)

# Display the size to the user
echo "The total size of the directory is: $size"

# Convert the size to a comparable format (in bytes) for checking against 100MB
# Use du without -h to get the size in kilobytes (so du -sk)
size_in_kb=$(du -sk "$directory" | cut -f1)

# 100MB is equal to 102400KB (100 * 1024)
if [ "$size_in_kb" -gt 102400 ]; then
    echo "Warning: Directory exceeds 100MB"
    # Extra: Compress the directory or its files
    echo "Do you want to compress the directory? (yes/no)"
    read compress_choice
    if [ "$compress_choice" == "yes" ]; then
        echo "Compressing the directory..."
        zip -r "${directory##*/}.zip" "$directory"
        echo "Directory compressed into ${directory##*/}.zip"
    else
        echo "Compression skipped."
    fi
fi

