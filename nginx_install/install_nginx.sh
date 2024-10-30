#!/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Update package lists
echo "Updating package lists..."
sudo apt update -y || { echo "Failed to update package lists"; exit 1; }

# Install Nginx
echo "Installing Nginx..."
sudo apt install nginx -y || { echo "Failed to install Nginx"; exit 1; }

# Enable Nginx to start on boot
echo "Enabling Nginx to start on boot..."
sudo systemctl enable nginx

# Start Nginx service
echo "Starting Nginx..."
sudo systemctl start nginx

# Check Nginx status
echo "Checking Nginx status..."
sudo systemctl status nginx

echo "Nginx installation completed successfully!"
