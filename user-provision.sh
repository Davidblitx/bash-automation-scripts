#!/bin/bash

# --- 1. Root Check ---
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run as root (use sudo)."
  exit 1
fi

# --- 2. Argument Check ---
# Ensure the user provided a name (e.g., ./user-provision.sh username)
USERNAME=$1

if [ -z "$USERNAME" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

# --- 3. Check if User Exists ---
# 'id' returns an error if the user doesn't exist. We hide the output with &> /dev/null.
if id "$USERNAME" &>/dev/null; then
  echo "User '$USERNAME' already exists."
  exit 1
else
  # --- 4. Create the User ---
  # -m creates a home directory for the new user.
  useradd -m "$USERNAME"
  
  if [ $? -eq 0 ]; then
    echo "User '$USERNAME' has been created successfully!"
    echo "$(date): Created user $USERNAME" >> user-management.log
  else
    echo "Failed to create user '$USERNAME'."
    exit 1
  fi
fi
