#!/bin/bash

THRESHOLD_CRITICAL=90
THRESHOLD_WARNING=70

USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
echo "Current disk $USAGE"

if [ $USAGE -gt $THRESHOLD_CRITICAL ]; then
     echo "x CRITICAL: Disk usage is way above $THRESHOLD_CRITICAL%"
elif [ $USAGE -gt $THRESHOLD_CRITICAL ]; then
     echo "WARNING: Disk usage is  above $THRESHOLD_CRITICAL&"
else
     echo "Disk is Okay"
fi