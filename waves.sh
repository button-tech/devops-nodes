#!/bin/bash
# for debian 9 (stretch)

DockerVolumeName=dvn

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
docker run -d -p 6869:6869 -p 6868:6868 -e WAVES_NETWORK=MAINNET -e WAVES_LOG_LEVEL=DEBUG -e WAVES_HEAP_SIZE=2g -v $DockerVolumeName:/waves wavesplatform/node
