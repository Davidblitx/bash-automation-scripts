#!/bin/bash

# Configuration
SOURCE="$HOME/my-documents"
DESTINATION="$HOME/my-backups"
LOGFILE="$DESTINATION/backup.log"
RETENTION_DAYS=30
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME="backup_$TIMESTAMP.tar.gz"

# Section 2: if Source Exists
if [ ! -d "$SOURCE" ]; then
    echo "Error: Directory not found: $SOURCE"
    exit 1
fi

#Section 3: Destination Directory
mkdir -p $DESTINATION

# Section 4: Timestamped Backup
echo "Current timestamp: $TIMESTAMP"
tar -czf "$DESTINATION/$FILENAME" "$SOURCE"

# Sectio 5: Log the Operation
echo "$(date): Backup started for $SOURCE" >> "$LOGFILE"
if [ $? -eq 0 ]; then
    echo "$(date): Backup completed: $FILENAME" >> "$LOGFILE"
else
    echo "$(date): Backup FAILED for $SOURCE" >> "$LOGFILE"
    exit 1
fi

# Section 6: Cleanup Old Backups
DELETED_COUNT=$(find "$DESTINATION" -name "*.tar.gz" -mtime +$RETENTION_DAYS -print | wc -l)
find $DESTINATION -name "*.tar.gz" -mtime +$RETENTION_DAYS -delete
echo "$(date): Deleted $DELETED_COUNT Old backups (older than $RETENTION_DAYS days)" >> "$LOGFILE"

# Section 7: Summary output
echo ""
echo "Backup Successful"
echo "File: $DESTINATION/$FILENAME"
echo "Size: $(du -sh "$DESTINATION/$FILENAME" | cut -f1)"
echo "Log: $LOGFILE"
echo ""
