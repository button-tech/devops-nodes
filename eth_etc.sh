#!/bin/sh
# for debian 9 (stretch)

ConteinerName=name
DockerVolumeName=${VARIABLE:-default}

# install docker
apt update
apt upgrade
apt install apt-transport-https ca-certificates curl software-properties-common gnupg2
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce

# install git
# apt install git

# clone parity rep
git clone https://github.com/paritytech/parity-ethereum.git
cd parity-ethereum
cp scripts/docker/alpine/Dockerfile .
docker build -t $ConteinerName .


docker volume create $DockerVolumeName

docker run --restart always -ti -d \
-p 8180:8180 -p 8545:8545 -p 8546:8546 -p 30303:30303 -p 30303:30303/udp \
--name parity --restart always \
-v $DockerVolumeName:/home/parity/.local/share/io.parity.ethereum \
$ConteinerName:latest \
--jsonrpc-interface '0.0.0.0' --jsonrpc-hosts="all" \
--auto-update="all" \
--stratum --stratum-interface=0.0.0.0 \
--jsonrpc-cors null \
--unsafe-expose \
--db-compaction hdd \
--mode active --cache-size 4096 \
--ui-interface 0.0.0.0

# --chain classic - for ETC
docker logs --follow parity
