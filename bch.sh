#!/bin/bash
# for debian 9 (stretch)

apt update
apt upgrade

# Install dependencies

# install git
# apt install git

# Conan
wget https://dl.bintray.com/conan/installers/conan-ubuntu-64_1_11_2.deb
dpkg -i conan-ubuntu-64_1_11_2.deb

# Cmake
apt-get install cmake

# g++
apt-get install g++

# Dotnet
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/9/prod.list
mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
chown root:root /etc/apt/sources.list.d/microsoft-prod.list
apt-get update
apt-get install dotnet-sdk-2.2

# Run bitprim
git clone https://github.com/bitprim/bitprim-insight.git
cd bitprim-insight/bitprim.insight
dotnet build /p:BCH=true -c Release -v normal


# TODO: appsettings.json
nohup dotnet bin/Release/netcoreapp2.0/bitprim.insight.dll --server.port=3000 --server.address=0.0.0.0 &
