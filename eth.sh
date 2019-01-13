#!/bin/sh

docker pull parity/parity:nightly
docker rm -f parity
docker run --restart always -ti -d \
-p 8180:8180 -p 8545:8545 -p 8546:8546 -p 30303:30303 -p 30303:30303/udp \
--name parity --restart always \
-v /srv/parity:/root/.local/share/io.parity.ethereum/ parity/parity:v2.1.3 \
--jsonrpc-interface '0.0.0.0' --jsonrpc-hosts="all" \
--author 0xYOURETHADDRESSHERE \
--auto-update="all" \
--stratum --stratum-interface=0.0.0.0 \
--jsonrpc-cors null \
--unsafe-expose \
--db-compaction hdd \
--mode active --cache-size 4096 \
--
--ui-interface 0.0.0.0 --ui-no-validation

docker logs --follow parity
