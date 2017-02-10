#!/bin/bash

echo 'Update & upgrade system...'
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install curl -y

echo 'Init Docker repo...'
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo touch /etc/apt/sources.list.d/docker.list
sudo echo "deb https://apt.dockerproject.org/repo raspbian-jessie main" > /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-cache policy docker-engine

echo 'Install Docker...'
sudo apt-get update
sudo apt-get -y install docker-engine

echo 'Run Docker service...'
sudo service docker start

echo 'Setup Docker...'
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart

echo 'Prepare env for containers...'
mkdir /home/pi/atomdata

echo 'Run Atom container...'
docker run -d -p 4000-4500:4000-4500 --restart=always --privileged -v /dev/bus/usb:/dev/bus/usb -v /home/pi/atomdata:/distr/data princip/atom2:arm

echo 'Done :)'
