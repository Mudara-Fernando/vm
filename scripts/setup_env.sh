#!/bin/bash

# Update package list and install prerequisites
sudo yum update -y
sudo yum install -y curl epel-release
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo yuminstall git

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Enable Docker to start on boot
sudo systemctl start docker
systemctl enable docker

# Install Certbot
yum install -y certbot python3-certbot-nginx

# Restart Nginx to apply changes
systemctl restart nginx
