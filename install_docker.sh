#!/bin/bash

# Update the package list
sudo apt-get update

# Install required packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list again
sudo apt-get update

# Install Docker Engine, Docker CLI, and Containerd
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add the current user to the Docker group to run Docker without sudo
sudo usermod -aG docker $USER

# Verify Docker installation
docker --version

echo "Docker has been successfully installed! Please restart your session to apply group changes."