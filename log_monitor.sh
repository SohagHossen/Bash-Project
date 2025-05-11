#!/bin/bash

# Log files to monitor (edit based on your system)
LOG_FILES=(
  "/var/log/syslog"
  "/var/log/messages"
  "/var/log/auth.log"
  "/var/log/nginx/error.log"
  "/var/log/httpd/error_log"
)

# Output log file
OUTPUT_LOG="$HOME/error_monitor_$(date +%F).log"

# Patterns to match
PATTERNS="error|fail|critical|warn|denied"

# Header
echo "Monitoring logs for patterns: $PATTERNS"
echo "Logging to: $OUTPUT_LOG"
echo "Started at: $(date)" >> "$OUTPUT_LOG"

# Loop through files and tail them
for file in "${LOG_FILES[@]}"; do
  if [[ -f "$file" ]]; then
    echo "Watching: $file"
    tail -Fn0 "$file" | \
    grep --line-buffered -iE "$PATTERNS" | \
    while read line; do
      echo "[$(date +'%F %T')] $file: $line" | tee -a "$OUTPUT_LOG"
    done &
  else
    echo "File not found: $file"
  fi
done

# Keep script running
wait
