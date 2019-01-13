# devops-nodes
Guide how to set up your full node for BTC/BTH/ETH/ETC/LTC

 - ETH(Parity)

Fast start:
```
# sudo docker run --restart=always -ti -d -p 8545:8545 \ 
-p 8546:8546 -p 30303:30303  -p 30303:30303/udp \ 
parity/parity:v2.1.3 --ui-interface all --jsonrpc-interface all 
```
Full start(with docker volume) - eth.sh

- ETC(Parity)

```
# sudo  docker run --restart=always -ti -d -p 8545:8545 \ 
-p 8546:8546 -p 30303:30303 -p 30303:30303/udp \ 
parity/parity:v2.1.3 --ui-interface all --jsonrpc-interface all \
 --chain classic 
```
Full start(with docker volume) - etc.sh

