#!/bin/bash

echo "My liege, what website would you like to check the status of?: "
read website

if [[ ! "$website" =~ ^https:// ]]; then
	website="https://$website"
fi

User_Agent=$(google-chrome --user-agent)
echo $User_Agent

#wget -p $website
# curl -o /dev/null -s --head --write-out "%{http_code}\n" $website
#http_code=$(wget -o /dev/null -s -w "%{http_code}" "$website")
#http_code=$(wget --server-response --content-on-error=off $website)
#echo $http_code

#echo "$website returns a $http_code status code"
