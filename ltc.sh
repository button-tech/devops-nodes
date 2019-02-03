#!/bin/bash
# for debian 9 (stretch)

DockerVolumeName=ltc

# install docker
apt update
apt upgrade
apt install apt-transport-https ca-certificates curl software-properties-common gnupg2
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce


docker create volume $DockerVolumeName
docker run -e LITECOIN_LIVENET=1 -d -p 3001:3001 -p 9333:9333 \
-v $DockerVolumeName:/root/litecoin-node/livenet \
--name litecoin-livenet berrywallet/litecore-node
