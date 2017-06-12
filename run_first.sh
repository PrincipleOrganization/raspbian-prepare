#!/bin/bash

echo 'Update & upgrade system...'
apt-get update
apt-get install curl -y

echo 'Install Docker...'
curl -sSL https://get.docker.com | sh

echo 'Unmask and start service...'
sudo systemctl unmask docker.service
sudo systemctl unmask docker.socket
sudo systemctl start docker.service

echo 'System reboot...'
sudo reboot
