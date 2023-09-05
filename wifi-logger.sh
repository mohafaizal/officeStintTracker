#!/bin/bash

desired_ssid="SSID" # Replace with the SSID of your target network
log_dir="/path/to/directory/log"
log_file="$log_dir/wifi-logger.log"

if [ ! -d "$log_dir" ]; then
	echo "Creating log directory ..."
	mkdir -p "$log_dir"
fi

echo "Script wifi-logger executed at $(date)" >> "$log_file"

current_ssid=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F' SSID: ' '/SSID: /{print $2}')
echo "Conected to SSID: $current_ssid"

if [ "$current_ssid" == "$desired_ssid" ]; 
then
        echo "Connected to $desired_ssid at $(date)" >> "$log_file"
else
	echo "Connect to $current_ssid at $(date)" >> "$log_file"
fi
