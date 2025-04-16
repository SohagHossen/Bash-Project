#!/bin/bash

# === CONFIGURATION ===
LOGFILE="/var/log/maillog"                     # or /var/log/mail.log depending on distro
REPORT_DIR="/var/log/mail-reports"
TODAY=$(date +"%Y-%m-%d")
REPORT_FILE="$REPORT_DIR/mail-report-$TODAY.txt"

# Create report directory if it doesn't exist
mkdir -p "$REPORT_DIR"

# Generate report
{
    echo "==== Mail Report for $TODAY ===="
    echo ""
    echo "📨 Total Emails Sent:"
    grep -i "status=sent" "$LOGFILE" | wc -l
    echo ""
    echo "👤 Top 10 Email Senders:"
    grep -i "status=sent" "$LOGFILE" | grep -oP 'from=<\K[^>]*' | sort | uniq -c | sort -nr | head -10
} > "$REPORT_FILE"

# Cleanup: Delete reports older than 7 days
find "$REPORT_DIR" -type f -name "mail-report-*.txt" -mtime +7 -exec rm -f {} \;

