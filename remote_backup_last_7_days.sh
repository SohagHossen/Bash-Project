#!/bin/bash

# Remote Backup Script
# Backs up files modified in the last 7 days from a remote server.

# Configuration
REMOTE_USER="your_remote_user"          # Remote server username
REMOTE_HOST="your_remote_host"          # Remote server IP or hostname
REMOTE_DIR="/path/to/remote/directory"  # Remote directory to back up
LOCAL_BACKUP_DIR="/path/to/local/backup" # Local directory to store backups
LOG_FILE="/path/to/backup.log"          # Log file for backup process

# Create local backup directory if it doesn't exist
mkdir -p "$LOCAL_BACKUP_DIR"

# Logging function
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Start backup
log "Starting remote backup from $REMOTE_HOST..."

# Use rsync to copy files modified in the last 7 days
rsync -avz --progress \
    --files-from=<(ssh "$REMOTE_USER@$REMOTE_HOST" "find $REMOTE_DIR -type f -mtime -7") \
    "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR" \
    "$LOCAL_BACKUP_DIR"

# Check if rsync was successful
if [ $? -eq 0 ]; then
    log "Backup completed successfully."
else
    log "Backup failed. Please check the logs."
    exit 1
fi