#!/bin/bash

# Function to check if Apache service is running
check_apache_status() {
    apache_status=$(systemctl is-active apache2)

    if [ "$apache_status" = "active" ]; then
        return 0
    else
        return 1
    fi
}

# Function to generate log files
generate_log_file() {
    local status="$1"
    local message="$2"
    local log_file="$3"

    echo "$(date '+%Y-%m-%d %H:%M:%S') Apache $status: $message" >> "$log_file"
}

# Directory to store log files
log_directory="/home/ec2-user/efs/logs"

# Create log directory if it doesn't exist
mkdir -p "$log_directory"

# Check Apache service status
if check_apache_status; then
    status="ONLINE"
    message="Apache service is running."
    log_file="$log_directory/online.log"
else
    status="OFFLINE"
    message="Apache service is not running."
    log_file="$log_directory/offline.log"
fi

# Generate log file
generate_log_file "$status" "$message" "$log_file"

# Print service status and message
echo "$(date '+%Y-%m-%d %H:%M:%S') Apache service is $status: $message"
