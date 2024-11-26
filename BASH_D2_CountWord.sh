#!/bin/bash

# shopt: shell option; '-s' sets the 'nocasematch', so pattern matching is case insensitive. For this script, this is enabled so a user can input y or Y and still be able to re run the script
shopt -s nocasematch

# we initiate a while loop here so the user can try the script again for more words / files if they would like to
while i=y
do
# The below echo statement prompts the user for the file they want to count words in, and saves it to a variable
echo "Enter the text file you would like to count the occurrence of a word in: "
read file

# The below echo statement prompts the user for the word they want to count in the file they specified above
echo "Enter the word you would like to count the number of occurrence of in $file: "
read word

echo "counting occurrences of word $word in $file..."

# The main event! the '-o' flag for grep outputs each word found to a new line; the "-i" flag ignores case, grabbing the word regardless of it's case
# 'wc' is word count, and the -l flag counts each line - in this case, we pipe the word (stored in our $word variable) found in the file (stored in $file) into our wc command, which counts each line, which in this instance also counts each word
wordcount=$(grep -o -i $word $file | wc -l)

# our final echo statement, telling the user how many times the word they requested appears in the file
echo "The word $word occurs $wordcount times in $file"  

echo "would you like to to find words in another file? (y/n)"
read i
done
