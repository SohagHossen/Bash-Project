#!/bin/bash

IP="192.168.1.1"
PORT=22

if nc -z -w2 "$IP" "$PORT"; then
    echo "Server $IP is UP on port $PORT"
else
    echo "Server $IP is DOWN on port $PORT"
fi
