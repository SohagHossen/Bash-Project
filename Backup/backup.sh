#!/bin/bash

# Define variables
BACKUP_DIR="/backup"
SOURCE_DIR="/path/to/your/data"  # Replace with the directory you want to back up
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Create a compressed archive of the source directory
tar -czf $BACKUP_FILE -C $SOURCE_DIR .

# Delete backups older than 7 days
find $BACKUP_DIR -type f -name "backup_*.tar.gz" -mtime +7 -exec rm {} \;
