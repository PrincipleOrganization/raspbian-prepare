#!/bin/bash

echo 'Update & upgrade system...'
apt-get update && apt-get upgrade -y
apt-get install curl -y

echo 'Install Docker...'
curl -sSL https://get.docker.com | sh

echo 'Unmask and start service...'
sudo systemctl unmask docker.service
sudo systemctl unmask docker.socket
sudo systemctl start docker.service

echo 'Prepare env for containers...'
mkdir /home/pi/atomdata

echo 'Run Atom container...'
docker run -d -p 4000-4500:4000-4500 --restart=always --privileged -v /dev/bus/usb:/dev/bus/usb -v /home/pi/atomdata:/distr/data --name atom princip/atom2:arm

echo 'Done'
