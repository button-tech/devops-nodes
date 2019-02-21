# Devops-nodes
Guide how to set up your full node for BTC/BCH/ETH/ETC/LTC/Waves

## ETH(Parity)

Fast start:
```
# docker run --restart=always -ti -d -p 8545:8545 \ 
-p 8546:8546 -p 30303:30303  -p 30303:30303/udp \ 
parity/parity:v2.1.3 --ui-interface all --jsonrpc-interface all 
```
Full start(with docker volume) - [eth.sh](https://github.com/button-tech/devops-nodes/blob/master/eth.sh)

- Disk space used ~ 100GB

- Load average ~ 3.38, 3.36, 3.31


Virtual machine specifications:

- CPU: Intel(R) Xeon(R) CPU E5-2676 v3 @ 2.40GHz

- RAM: 4GB

- Disk space: 600GB

## ETC(Parity)

Fast start:
```
# docker run --restart=always -ti -d -p 8545:8545 \ 
-p 8546:8546 -p 30303:30303 -p 30303:30303/udp \ 
parity/parity:v2.1.3 --ui-interface all --jsonrpc-interface all \
 --chain classic 
```
Full start(with docker volume) - [etc.sh](https://github.com/button-tech/devops-nodes/blob/master/etc.sh)

(Add the "--chain classic" flag to the end of the script)

- Disk space used ~ 146GB

- Load average ~ 0.12, 0.09, 0.06


Virtual machine specifications:

- CPU: Intel(R) Xeon(R) CPU E5-2676 v3 @ 2.40GHz

- RAM: 4GB

- Disk space: 600GB


## BTC(Insight-api)

```
# git clone https://github.com/WooGenius/bitcore-docker
# cd bitcore-docker
# docker-compose up --build -d
```

Or use this -  [btc.sh](https://github.com/button-tech/devops-nodes/blob/master/btc.sh)


- Disk space used ~ 443GB

- Lload average ~ 0.13, 0.03, 0.01


Virtual machine specifications:

- CPU: Intel(R) Xeon(R) CPU E5-2676 v3 @ 2.40GHz

- RAM: 4GB

- Disk space: 600GB


## LTC(Insight-api)

```
# docker run -e LITECOIN_LIVENET=1 -d -p 3001:3001 -p 9333:9333 \ 
-v your_volume:/root/litecoin-node/data \
--name litecoin-livenet berrywallet/litecore-node
```

- Disk space used ~ 50GB

- Lload average ~ 0.01, 0.02, 0.00


Virtual machine specifications:

- CPU: Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz

- RAM: 4GB

- Disk space: 500GB


## BCH (bitprim)
Full instruction - [bitprim-insight](https://github.com/bitprim/bitprim-insight)

```
Dependencies install 

1.Conan

# wget https://dl.bintray.com/conan/installers/conan-ubuntu-64_1_11_2.deb
# dpkg -i conan-ubuntu-64_1_11_2.deb

2.Cmake

# apt-get install cmake

3. g++

# apt-get install g++

4.Dotnet

# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
# mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
# wget -q https://packages.microsoft.com/config/debian/9/prod.list
# mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
# chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
# chown root:root /etc/apt/sources.list.d/microsoft-prod.list
# apt-get update
# apt-get install dotnet-sdk-2.2

5.Run bitprim(full-node)

# git clone https://github.com/bitprim/bitprim-insight.git
# cd bitprim-insight/bitprim.insight
# dotnet build /p:BCH=true -c Release -v normal

After create appsettings.json

# nohup dotnet bin/Release/netcoreapp2.0/bitprim.insight.dll --server.port=3000 --server.address=0.0.0.0 &

```

## Waves 

```
# docker run -d -p 6869:6869 -p 6868:6868 -e WAVES_NETWORK=MAINNET \ 
 -e WAVES_LOG_LEVEL=DEBUG -e WAVES_HEAP_SIZE=2g -v your_volume:/waves wavesplatform/node
```
## Stellar

```
# docker run -d -p "8000:8000" -v your_volume:/stellar --name stellar stellar/quickstart --pubnet
```


