#!/bin/bash

log_file="/var/log/auth_log.log"

while IFS= read -r line
do
    echo "Processing line: $line"
done < "$log_file"
