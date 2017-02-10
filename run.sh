#!/bin/bash

echo 'Update & upgrade system...'
apt-get update && apt-get upgrade -y
apt-get install curl -y

echo 'Install Docker...'
curl -sSL https://get.docker.com | sh

echo 'Setup Docker...'
groupadd docker
gpasswd -a ${USER} docker
service docker restart

echo 'Prepare env for containers...'
mkdir /home/pi/atomdata

echo 'Run Atom container...'
docker run -d -p 4000-4500:4000-4500 --restart=always --privileged -v /dev/bus/usb:/dev/bus/usb -v /home/pi/atomdata:/distr/data princip/atom2:arm

echo 'Done :)'
