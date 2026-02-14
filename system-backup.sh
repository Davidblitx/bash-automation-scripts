#!/bin/bash

# Configuration
SOURCE="~/my-data"
DESTINATION="~/my-backups"
FILENAME="backup_$(date +%Y%m%d).tar.gz"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

mkdir -p "$DESTINATION"

# If the source folder doesnt exist
if [ -d "$SOURCE" ]; then
tar -czf "${DESTINATION}/backup_${TIMESTAMP}.tar.gz" "${SOURCE}"
     echo "Backup completed successfully!"
else
    echo "Error: Source directory not found."
fi

