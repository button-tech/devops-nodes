#!/bin/bash

# for debian 9 (stretch)


currency=$1

ConteinerName=local/$currency
DockerVolumeName=$currency

if [ $currency = "eth" ]; then
      chain=mainnet
else 
      chain=classic      
fi

# install docker
apt update
apt upgrade
apt install apt-transport-https ca-certificates curl software-properties-common gnupg2
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce

docker volume create --driver=local --opt o=uid=1000 --opt type=tmpfs --opt device=tmpfs paritydb

docker run --restart always -ti -d \
-p 8180:8180 -p 8545:8545 -p 8546:8546 -p 30303:30303 -p 30303:30303/udp \
--name parity --restart always \
-v paritydb:/home/parity/.local/share/io.parity.ethereum \
parity/parity:latest \
--jsonrpc-interface '0.0.0.0' --jsonrpc-hosts="all" \
--auto-update="all" \
--stratum --stratum-interface=0.0.0.0 \
--jsonrpc-cors null \
--unsafe-expose \
--db-compaction hdd \
--mode active --cache-size 4096 \
--chain $chain