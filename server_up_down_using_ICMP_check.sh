#!/bin/bash

IP="192.168.1.1"

if ping -c 1 -W 1 "$IP" > /dev/null 2>&1; then
    echo "Server $IP is UP"
else
    echo "Server $IP is DOWN"
fi
