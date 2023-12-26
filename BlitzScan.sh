#!/bin/bash

# Clear the screen
clear

# Optionally display the Introxt logo (if available)
[ -d Logo ] && [ -x Logo/introxt_logo ] && cd Logo && ./introxt_logo && cd ..

# Get user input
read -p "Enter the interface: " int
read -p "Enter the starting IP address (e.g., 192.168.1.1): " start_ip
read -p "Enter the ending IP address: " end_ip

# Validate IP addresses
if [[ ! $start_ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ || ! $end_ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Invalid IP address format."
    exit 1
fi

# Prepare output files
echo $int > alive_hosts.txt
echo $int > ping.txt

# Iterate through IP addresses efficiently
for ip in $(seq $start_ip $end_ip); do
    ping -I $int -f -i 0 -s 0 -c 2 -w 1 $ip >> ping.txt
    if [ $? -eq 0 ]; then
        echo $ip
        arp $ip >> alive_hosts.txt
    fi
done

# Display results
cat alive_hosts.txt
echo "Scan complete."
