#!/bin/bash
set -e

# Update system packages
apt-get update -y

# Install NGINX fresh
apt-get install -y nginx

# Enable & start NGINX
systemctl enable nginx
systemctl start nginx

# Restart to apply changes
systemctl restart nginx

