#!/bin/bash

# Configuration 
SERVICES=("docker" "ssh")
HOSTS=("google.com" "github.com")
DISK_THRESHOLD=80
LOGFILE="deployment.log"

# Counters
CHECKS_PASSED=0
CHECKS_FAILED=0

# Section 1: Check Services
echo "=== Checking services ==="
for service in "${SERVICES[@]}"; do
     echo "Checking services for $service"
    if systemctl is-active --quiet "$service"; then
         echo "✓ $service is running"
         CHECKS_PASSED=$((CHECKS_PASSED + 1))
    else
         echo "✗ $service is not running"
         CHECKS_FAILED=$((CHECKS_FAILED +1))
         
    fi
done

# Check Disk Space
echo ""
echo "=== Checking Disk Space ==="
DISK_SPACE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
if [ $DISK_SPACE -gt $DISK_THRESHOLD ]; then 
     echo "x WARNING: Disk space is above $DISK_THRESHOLD"
     CHECKS_FAILED=$((CHECKS_FAILED + 1))
else
     echo "✓ Disk space is OK"
     CHECKS_PASSED=$((CHECKS_PASSED +1))
fi

# Check Network connectivity
echo ""
echo "=== Checking Network ==="
for host in "${HOSTS[@]}"; do
     echo "Checking connectivity for $host"
     if ping -c 1 $host &> /dev/null; then
          echo "✓ Can reach $host"
          CHECKS_PASSED=$((CHECKS_PASSED + 1))
     else
          echo "x Cannot reach $host"
          CHECKS_FAILED=$((CHECKS_FAILED +1))
     fi
done

# Section 4: Summary
echo ""
echo "=== Summary ==="
echo "Passed: $CHECKS_PASSED"
echo "Failed: $CHECKS_FAILED"
echo ""

# Log results
echo "$(date): Checks run - Passed: $CHECKS_PASSED, Failed: $CHECKS_FAILED" >> $LOGFILE

# Exit with appropriate code
if [ $CHECKS_FAILED -gt 0 ]; then
    echo "✗ DEPLOYMENT BLOCKED - Fix failures first"
    exit 1
else
    echo "✓ ALL CHECKS PASSED - Safe to deploy"
    exit 0
fi

