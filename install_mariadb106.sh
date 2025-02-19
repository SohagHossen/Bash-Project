#!/bin/bash

# Update the system
echo "Updating the system..."
sudo dnf update -y

# Install MariaDB 10.6
echo "Installing MariaDB 10.6..."
sudo dnf install mariadb-server -y

# Start and enable MariaDB service
echo "Starting and enabling MariaDB service..."
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure MariaDB installation
echo "Securing MariaDB installation..."
sudo mysql_secure_installation

# Check MariaDB status
echo "Checking MariaDB status..."
sudo systemctl status mariadb



# Print completion message
echo "MariaDB 10.6 installation and setup completed!"
echo "You can log in to MariaDB using: mysql -u root -p"