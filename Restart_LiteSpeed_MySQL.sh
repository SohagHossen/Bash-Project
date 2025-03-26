#!/bin/bash

# Restart LiteSpeed
echo "Restarting LiteSpeed Web Server..."
/usr/local/lsws/bin/lswsctrl restart

# Restart MySQL
echo "Restarting MySQL..."
systemctl restart mysqld

# Check Status
echo "Checking service status..."
/usr/local/lsws/bin/lswsctrl status
systemctl status mysqld --no-pager

echo "Restart Completed!"
