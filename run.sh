#!/bin/bash

echo 'Update & upgrade system...'
sudo su
apt-get update & apt-get upgrade -y
apt-get install curl

echo 'Init Docker repo...'
apt-get install apt-transport-https ca-certificates software-properties-common

curl -fsSL https://yum.dockerproject.org/gpg | apt-key add -
add-apt-repository "deb https://apt.dockerproject.org/repo/ debian-$(lsb_release -cs) main"

echo 'Install Docker...'
apt-get update
apt-get -y install docker-engine

echo 'Prepare env for containers...'
mkdir /home/pi/atomdata

echo 'Run Atom container...'
docker run -d -p 4000-4500:4000-4500 --restart=always --privileged -v /dev/bus/usb:/dev/bus/usb -v /home/pi/atomdata:/distr/data princip/atom2:arm

echo 'Done :)'
