#!/bin/bash

# Define the new DNS server
NEW_DNS="8.8.8.8"

# Get the active connection name
CONNECTION_NAME=$(nmcli -t -f NAME connection show --active | head -n1)

# Change the DNS server for the active connection
sudo nmcli connection modify "$CONNECTION_NAME" ipv4.dns "$NEW_DNS"
sudo nmcli connection down "$CONNECTION_NAME"
sudo nmcli connection up "$CONNECTION_NAME"

echo "DNS server changed to $NEW_DNS for connection $CONNECTION_NAME"