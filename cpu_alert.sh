#!/bin/bash

# Configuration
ADMIN_EMAIL="admin@example.com"  # Replace with admin email
CPU_THRESHOLD=80                # Alert threshold (80%)
PROCESS_NAME="$1"               # Process name to monitor (passed as script argument)

# Check if process name is provided
if [ -z "$PROCESS_NAME" ]; then
  echo "Error: Please specify a process name."
  exit 1
fi

# Get CPU usage for the specified process
CPU_USAGE=$(ps aux | grep "$PROCESS_NAME" | grep -v grep | awk '{sum += $3} END {print sum}')

# Check if CPU usage exceeds threshold
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
  # Send email alert
  echo "Alert: Process '$PROCESS_NAME' CPU usage is ${CPU_USAGE}% (exceeds ${CPU_THRESHOLD}%) on $(hostname) at $(date)" | \
  mail -s "High CPU Usage Alert: $PROCESS_NAME" "$ADMIN_EMAIL"
fi