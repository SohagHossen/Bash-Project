#!/bin/bash

LOG_DIR="/var/log"

OUTPUT_FILE="/etc/log-monitor.log"

KEYWORDS="error|failed|fail|critical"

# Create or clear the output file
> "$OUTPUT_FILE"

# Loop through log files
find "$LOG_DIR" -type f -name "*.log" | while read -r logfile; do
    grep -inE "$KEYWORDS" "$logfile" | while read -r line; do
        echo "[$logfile] $line" >> "$OUTPUT_FILE"
    done
done

echo "Log monitoring completed. Results saved to $OUTPUT_FILE"
