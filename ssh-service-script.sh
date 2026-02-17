#!/bin/bash

SERVICE="ssh"

# Checks if service is active
if ssh is-active --quite $SERVICE; then
    echo "✓ $SERVICE is running"
else 
    echo "x $SERVICE is NOT running"
fi
