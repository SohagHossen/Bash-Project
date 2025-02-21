#!/bin/bash

# Define the domain
domain="google.com"

# List of common DNS record types to check
record_types=("A" "AAAA" "CNAME" "MX" "NS" "SOA" "TXT" "SRV" "PTR")

# Loop through each record type and query the DNS
for record in "${record_types[@]}"; do
    echo "Checking $record record for $domain:"
    dig +short $domain $record
    echo "----------------------------------------"
done