#!/bin/bash

# --- 1. Configuration ---
URL="https://www.google.com"
LOG_FILE="deployment.log"

# --- 2. The Check ---
echo "Checking connection to $URL..."
status_code=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

# --- 3. Logic & Logging ---
if [ "$status_code" = "200" ]; then
    # Successful Path
    echo "Status code is 200 - Site is UP"
    # The '>>' appends the date and success message to the log file.
    echo "$(date): SUCCESS - $URL is accessible (200 OK)" >> "$LOG_FILE"
else
    # Failure Path
    echo "Sound the alarm - Status code is $status_code"
    # Log the failure with the specific error code
    echo "$(date): CRITICAL - $URL is down. Status: $status_code" >> "$LOG_FILE"
    
    # Exit with code 1 to tell the system the script failed
    exit 1
fi


