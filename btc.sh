#!/bin/bash
# for debian 9 (stretch)

# install docker
apt update
apt upgrade
apt install apt-transport-https ca-certificates curl software-properties-common gnupg2
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt update
apt install docker-ce
apt install docker-compose

# install git
apt install git


git clone https://github.com/WooGenius/bitcore-docker
cd bitcore-docker/
docker-compose up --build -d
