#!/bin/bash

# Alright, we will start with a while loop to envelope the whole system information script. I = Y or y, so that at the end of the script, when the user is asked if they want to choose another option from the menu, they can hit Y for yes and the script will read that as yes

i="Y"

while [ "$i" = "Y" ] || [ "$i" = "y" ]
do

# Alright, let's start with a variable library! The echo commands for the user-friendly menus will pull from these
# we curl -s (silenlty!) to hide the curl status bar (not very user friendly!) The url will give us our public IP
# hostname -i gives us our private IP
# whoami shows what user is currently signed into the terminal
# "nproc --all" gives us all cpu cores installed on the system
# "free -h" gives us memory metrics in human readable units, then we pipe that to a grep that gives us just the memory metrics, then we awk print the column with total memory and assign that to a variable
# we do the same as the above to get the metrics from the free memory column
 
public_ip=$(curl -s ipaddress.ai)
private_ip=$(hostname -i)
identity=$(whoami)
cpus=$(nproc --all)
total_memory=$(free -h | grep Mem |  awk '{print $2}')
free_memory=$(free -h | grep Mem | awk '{print $4}')

# Now comes the echo statements: The script will first greet the user, and then offer them the menu of options they can choose to learn about their system via the system information script

  echo "Hello User Supreme! What would you like to know about your system: "
  echo "1.System Public and Private IP: "
  echo "2.Current User identity: "
  echo "3.Amount of CPUs installed on your system: "
  echo "4.Amount of free memory on your system: "
  echo "5.A table of the top 5 memory intensive processes on your system: "
  echo "6.A table of the top 5 CPU intensive processes on your system: "
  echo "7.Test network connection to a website of your choice: "

# The below will read the choice (which should be a corresponding number to the option they want the script to give them, otherwise they will be given an error message), and then run the echo statement with variabls and operations within to give the information requested
  
  read ch
  case $ch in    
  1) echo "your Public IP is "$public_ip" ; your Private IP is "$private_ip".";;
  2) echo "you are "$identity".";;
  3) echo "your system has "$cpus" CPU(s).";;
  4) echo "there is "$free_memory" of total "$total_memory" available.";;
  5) echo "Here is a table of your Top 5 memory intensive processes: "
       sleep 1
       ps aux --sort='-%mem' | head -n 6;;
  6) echo "Here is a table of your Top 5 cpu intensive processes: "
       sleep 1
       ps aux --sort='-%cpu' | head -n 6;;
  7) echo "What website would you like to connect to?"

# The below was a doozy: So it stores the website given by the user in a varible ($website), then it pings that website by sending 4 packets (for brevity); then we use awk to search for the line containing "/packet loss/", assigns a variable to that column "packet_loss", then does the same for the time taken to ping the website, then we END the awk command and print out our packet_loss and time variables, seperated by a space These two fields become the $website_ping variable.
# We then create seperate variables for packet_loss and time that our final echo statement can use. Since those variables are stored in the $website_ping variable, we first echo that variable, then we use "cut" ( "-d' '" in this instance sets the delimtier for the variable as a space) to extract the first and second fields of the $website_ping variable (the packet_loss and time, respectively)

    	read website
    	website_ping=$(ping -c 4 $website | awk '/packet loss/ { packet_loss=$6 } /time/ { time=$10 } END { print packet_loss, time }')
    	packet_loss=$(echo $website_ping | cut -d' ' -f1)
    	time=$(echo $website_ping | cut -d' ' -f2)

     echo "It took "$time" to reach "$website" and there was "$packet_loss" packet loss getting there!";;
  *) echo "I cannot process that request; please choose a number from the menu above.";;
  esac

# The final echo statement closing out our while loop. There goes that i=Y variable in action!

  echo "Would you like to learn anything else about your system? [Y/N]"
  read i
done
echo "Hope your system is looking good! Have a great day!"
