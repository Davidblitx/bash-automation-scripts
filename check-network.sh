#!/bin/bash

HOST="google.com github.com 8.8.8.8"

for HOST in $HOST
do 
    echo "Checking connectivity for: $HOST"
    if ping -c 1 $HOST &> /dev/null; then
       echo "✓ Can reach $HOST"
    else
       echo "✗ Cannot reach $HOST"
    fi
done
