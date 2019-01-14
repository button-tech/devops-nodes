# devops-nodes
Guide how to set up your full node for BTC/BTH/ETH/ETC/LTC

 - ETH(Parity)

Fast start:
```
# sudo docker run --restart=always -ti -d -p 8545:8545 \ 
-p 8546:8546 -p 30303:30303  -p 30303:30303/udp \ 
parity/parity:v2.1.3 --ui-interface all --jsonrpc-interface all 
```
Full start(with docker volume) - [eth.sh](https://github.com/button-tech/devops-nodes/blob/master/eth.sh)

- ETC(Parity)

Fast start:
```
# sudo  docker run --restart=always -ti -d -p 8545:8545 \ 
-p 8546:8546 -p 30303:30303 -p 30303:30303/udp \ 
parity/parity:v2.1.3 --ui-interface all --jsonrpc-interface all \
 --chain classic 
```
Full start(with docker volume) - [etc.sh](https://github.com/button-tech/devops-nodes/blob/master/etc.sh)

- BTC(Insight-api)

```
# git clone https://github.com/WooGenius/bitcore-docker
# cd bitcore-docker
# sudo docker-compose up --build -d
```

- LTC(Insight-api)

```
# sudo docker run -e LITECOIN_LIVENET=1 -d -p 3001:3001 -p 9333:9333 \ 
-v /root/litecoin-node/livenet:/path/to/dir \
--name litecoin-livenet berrywallet/litecore-node
```
