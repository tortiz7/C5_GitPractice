#!/bin/bash

# Alright, first we are going to create a variable that keeps a record of the total count of lines with the 404 error. It is currently set to 0 so we can add each 404 error to it
total_count=0

# This while loop will loop through each line of the log file that contains '404' - it'll get the lines from the grep command that pipes them into the loop
while read -r line; do

  # the next command will set a variable for ip_address, using the all-powerful awk command to get just the ip address from the line
  # awks is powerful! -F is our field seperator, which we set to a comma, parenthesis and a space (the + means more than one comma or space will also work as the field seperators) so that we get just the IP address in the 2 column ($2), and not the identifer string that comes before it
  ip_address=$(echo "$line" | awk -F'[," ]+' '{print $2}')

  # this echo statement will print when a 404 error appears and display the associated ip address
  echo "Error: 404 | IP Address: $ip_address"

  # back to our total count variable! the +1 means that the 404 errors will be added incrementally to the count indicator variable (which is 0)
  total_count=$((total_count + 1))

# the "< <" is doing heavy lifting here - it's called process substitution, and it allows the grep function to pipe in the parsed out lines containing the 404 error into the while loop, which will then use those lines as the input for all the functions within the loop. Incredible stuff!
done < <(grep " 404 " web-server-access-logs.log)

# The final count of lines containing the 404 error
echo "Total 404 Errors: $total_count"

# PS: The one line answer is: grep " 404 " web-server-access-logs.log | awk -F'[," ]+' '{print "Error: 404 | IP Address:", $2}'
# This was so much fun!!
