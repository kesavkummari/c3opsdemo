#!/bin/bash

# Define the name of the service
service_name="httpd"

# Check if the service is running
is_running=$(pgrep "$service_name")

# If the service is not running
if [ -z "$is_running" ]; then
    echo "Service $service_name is not running. Restarting..."
    # Restart the service
    systemctl restart "$service_name"
    # Check if the service started successfully
    is_running=$(pgrep "$service_name")
    if [ -n "$is_running" ]; then
        echo "Service $service_name restarted successfully."
    else
        echo "Failed to restart $service_name."
        # You can add more actions here, like sending an email notification
    fi
else
    echo "Service $service_name is running."
fi
