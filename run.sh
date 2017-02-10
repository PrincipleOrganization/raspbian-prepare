#!/bin/bash

echo 'Update & upgrade system...'
apt-get update && apt-get upgrade -y
apt-get install curl -y

echo 'Init Docker repo...'
apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
touch /etc/apt/sources.list.d/docker.list
echo "deb https://apt.dockerproject.org/repo raspbian-jessie main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-cache policy docker-engine

echo 'Install Docker...'
apt-get update
apt-get -y install docker-engine

echo 'Run Docker service...'
service docker start

echo 'Setup Docker...'
groupadd docker
gpasswd -a ${USER} docker
service docker restart

echo 'Prepare env for containers...'
mkdir /home/pi/atomdata

echo 'Run Atom container...'
docker run -d -p 4000-4500:4000-4500 --restart=always --privileged -v /dev/bus/usb:/dev/bus/usb -v /home/pi/atomdata:/distr/data princip/atom2:arm

echo 'Done :)'
