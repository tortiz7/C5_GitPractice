#!/bin/bash

# Define the output log file
log_file="access.log"

# Clear the log file if it exists
> "$log_file"

# Define arrays of IP addresses and log messages
ips=("192.168.1.1" "192.168.1.2" "192.168.1.3" "192.168.1.4" "192.168.1.5" 
     "192.168.1.6" "192.168.1.7" "192.168.1.8" "192.168.1.9" "192.168.1.10")

messages=(
    "Accepted password for user1"
    "Accepted publickey for user2"
    "Failed password for invalid user admin"
    "Unauthorized access attempt"
    "Disconnected from user4"
    "Connection from"
    "Session opened for user3"
    "Session closed for user5"
    "error: Could not load host key"
    "error: PAM: Authentication failure"
)

# Generate random log entries
for i in {1..100}; do
    # Generate a random timestamp
    timestamp=$(date +"%b %d %H:%M:%S" -d "$((RANDOM % 30 + 1)) days ago")
    
    # Pick a random IP address and message
    ip=${ips[$((RANDOM % ${#ips[@]}))]}
    message=${messages[$((RANDOM % ${#messages[@]}))]}
    
    # Construct the log entry
    log_entry="$timestamp server sshd[$RANDOM]: $message $ip port $((RANDOM % 65535 + 1))"

    # Append the log entry to the log file
    echo "$log_entry" >> "$log_file"
done

echo "Log file created at $log_file"
