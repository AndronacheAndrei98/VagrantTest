#!/bin/bash

echo "Installing dependencies"
sudo apt-get update -y
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "Adding Docker GPG key"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Adding Docker repository"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing Docker"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Adding vagrant user to the docker group"
sudo usermod -aG docker vagrant

echo "Docker installation complete"

echo "Starting Redis installation on Ubuntu"

echo "Updating package index"
sudo apt update

echo "Installing redis-server"
sudo apt install -y redis-server

echo "Replace default Redis config"
sudo \cp -r /vagrant/redisConfig/redis.conf /etc/redis/

echo "Enabling Redis service to start on boot"
sudo systemctl enable redis-server

echo "Starting Redis service"
sudo systemctl start redis-server

echo "Checking Redis service status"
sudo systemctl status redis-server --no-pager

echo "Testing Redis server"
if redis-cli ping | grep -q PONG; then
    echo "O - Redis is up and running!"
else
    echo "X - Redis did not respond to ping."
fi