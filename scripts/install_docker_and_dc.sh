#!/bin/sh

sudo apt update
sudo apt install python3-dev python3-pip -y


echo "Downloading docker installation script..."
curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

sudo usermod -aG docker $USER

echo "Installing docker-compose..."

pip3 install docker-compose
sudo systemctl enable docker