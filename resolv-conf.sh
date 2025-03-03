#!/bin/bash

# Define the new DNS server
NEW_DNS="8.8.8.8"

# Backup the existing resolv.conf file
sudo cp /etc/resolv.conf /etc/resolv.conf.backup

# Write the new DNS server to resolv.conf
echo "nameserver $NEW_DNS" | sudo tee /etc/resolv.conf > /dev/null

echo "DNS server changed to $NEW_DNS"