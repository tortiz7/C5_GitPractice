#!/bin/bash

# Your task is to create a one-liner that:
# Reads the content of access.log.
# Extracts only the IP addresses.
# Counts the occurrences of each IP address to identify how many requests came from each IP.(unique addresses)
# Sorts the list by the number of requests in descending order.
# Saves the sorted list to a file called ip_counts.txt.
# name of log file: bash_log_2.txt
# Huge source of help (wish I found this yesterday!!!!):https://stackoverflow.com/questions/427979/how-do-you-extract-ip-addresses-from-files-using-a-regex-in-a-linux-shell

# Mike, thank you for allowing me to drill down on this! I learned so much:
# For starters, previously I was trying to force grep to look for any IP that started with "192*" because all the IP's I saw in the array in the given log started with those digit - the wildcard at the end allowed grep to find IPs with characters beyond thsoe first three digits
# How pedestrian! I can use a 'Regular Expression (regex)' to direct grep to find any IP's that fuilfill a certain criteria
# In the below function, we cat access.log, then use grep with the flag '-o' to only find the specific matches to the regex, rather than the whole line they appear in
# The regex is then formatted to direct grep to find particularly digits in 4 rows of 3, divided by a period, just like an IP!
# The [0-9} dictates the line can begin with any number between 0-9, and since [] are special characters (these dictate the range to be grep'd) we need to escape the special charater with a backslash \ to allow grep to get back to greppin 
# The {} is another special character - this one dictates the amount of digits we should be matching once we do stumble upon a line that fuliflls the criteria - in this case it's 1 to 3 digits - then we backslash out of that special character, and put a . to mark where the regex ends, since the octets are separated by periods. Then we repeat the criteria, since we need grep to find a match that has 4 octets in it, we repeat the regex 4 times
# 'sort' sorts the piped output of grep alphabetically, which allows us to use the uniq command with the -c flag to count how many occurences of a unique IP exist in the access.log file - so rather than printing every IP that appears in the file, it will print each IP and how many times that IP occurred
# sidenote - I was so nervous during the Mock tech, I didn't even realize the script was outputting a bunch of random IPs to a different file (access.log). Whoops!
# Finally, we sort the count of uniq IP's again, this time in numerical order (-n flag) and then we reverse that numerical order (-r) so that the most prevelant IP is printed first followed by the rest in desending order of occurence

cat access.log | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" | sort | uniq -c | sort -n -r > ip_counts.txt

# BONUS: Grep has a flag for extended regular expression (-E) that understands special characters and makes it so you don't have to escape after every used special character, so less backslashes!
#cat access.log | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort | uniq -c | sort -n -r > ip_counts.txt


