#!/bin/bash

# Restart Apache
echo "Restarting Apache..."
systemctl restart httpd

# Restart MySQL
echo "Restarting MySQL..."
systemctl restart mysqld

# Check Status
echo "Checking service status..."
systemctl status httpd --no-pager
systemctl status mysqld --no-pager

echo "Restart Completed!"
