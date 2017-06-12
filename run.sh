#!/bin/bash

echo 'Update & upgrade system...'
apt-get update && apt-get upgrade -y
apt-get install curl -y

echo 'Install Docker...'
curl -sSL get.docker.com | sh

echo 'Prepare env for containers...'
mkdir /home/pi/atomdata

echo 'Run Atom container...'
sudo docker run -d -p 4000-4005:4000-4005 --log-driver=none --restart=always --privileged -v /dev:/dev -v /home/pi/atomdata:/distr/data --name atom princip/atom2:arm

echo 'Done'
