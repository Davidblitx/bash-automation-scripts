#!/bin/bash

CHECKS_PASSED=0
CHECKS_FAILED=0

# Check 1
if systemctl is-active --quiet docker; then
    echo "✓ Docker running"
    CHECKS_PASSED=$((CHECKS_PASSED + 1))
else
    echo "✗ Docker not running"
    CHECKS_FAILED=$((CHECKS_FAILED +1))
fi

# Check 2
if ping -c 1 google.com &> /dev/null; then
    echo "✓ Network ok"
    CHECKS_PASSED=$((CHECKS_PASSED + 1))
else
    echo "✗ Network failed"
    CHECKS_FAILED=$((CHECKS_FAILED + 1))
fi

# Check 3
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$DISK_USAGE" -gt 90 ]; then
    echo "✓ Disk space ok"
    CHECKS_PASSED=$((CHECKS_PASSED + 1))
else
    echo "✗ Disk space critical"
    CHECKS_FAILED=$((CHECKS_FAILED + 1))
fi

# Summary
echo ""
echo "Passed: $CHECKS_PASSED"
echo "Failed: $CHECKS_FAILED"

if [ $CHECKS_FAILED -gt 0 ]; then
   echo "Deployment aborted - fix failures first"
   exit 1
else
    echo "All checks passed - safe to deploy"
    exit 0
fi
