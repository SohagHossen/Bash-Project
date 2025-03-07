#!/bin/bash

# Define the new DNS server
NEW_DNS="8.8.8.8"

# Change the DNS server using resolvectl
sudo resolvectl dns eth0 $NEW_DNS

echo "DNS server changed to $NEW_DNS"