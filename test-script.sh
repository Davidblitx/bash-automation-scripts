#!/bin/bash

# Create directory
mkdir -p my-docs
echo "file1" > my-docs/test1.txt
echo "file2" > my-docs/test2.txt
echo "file3" > my-docs/test3.txt

# Create tar.gz
tar -czf my-docs-backup.tar.gz my-docs

# Listing the archive size
ls -lh my-docs-backup.tar.gz

# Clean 
rm -rf my-docs my-docs-backup.tar.gz


