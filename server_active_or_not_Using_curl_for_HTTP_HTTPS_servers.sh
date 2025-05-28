#!/bin/bash

IP="192.168.1.1"

if curl -s --connect-timeout 3 "http://$IP" > /dev/null; then
    echo "Web server $IP is UP"
else
    echo "Web server $IP is DOWN"
fi