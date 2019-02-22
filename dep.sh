#!/bin/bash

# for debian 9 (stretch)

apt update
apt upgrade

# Install git
install git
apt install git

# Install tmux
apt install tmux

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