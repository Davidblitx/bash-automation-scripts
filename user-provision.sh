#!/bin/bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root (use sudo)"
    exit 1
fi

# Get username from command line
if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USERNAME=$1
LOGFILE="/var/log/user-provision.log"

# Create user
echo "Creating user: $USERNAME"
useradd -m -s /bin/bash $USERNAME

# Check if successful
if [ $? -eq 0 ]; then
    echo "$(date): User $USERNAME created successfully" >> $LOGFILE
    echo "✓ User created: $USERNAME"
else
    echo "$(date): Failed to create user $USERNAME" >> $LOGFILE
    echo "✗ Failed to create user"
    exit 1
fi

# Add to docker group (if it exists)
if getent group docker > /dev/null; then
    usermod -aG docker $USERNAME
    echo "$(date): Added $USERNAME to docker group" >> $LOGFILE
    echo "✓ Added to docker group"
fi

echo ""
echo "User provisioning complete"
echo "Username: $USERNAME"
echo "Home: /home/$USERNAME"
echo "Log: $LOGFILE"