#!/bin/bash

# Deploy Mosquitto brokers

mkdir -p data/mosquitto1/config
mkdir -p data/mosquitto1/data
mkdir -p data/mosquitto1/log
mkdir -p data/mosquitto2/config
mkdir -p data/mosquitto2/data
mkdir -p data/mosquitto2/log
mkdir -p data/mosquitto3/config
mkdir -p data/mosquitto3/data
mkdir -p data/mosquitto3/log

# create password file with users dev01, app01, app02 and app03 all with password passw0rd
docker run -itd -v `pwd`:/data --network brokers --name mosquitto1 $MOSQUITTO_IMAGE
touch `pwd`/passwd
docker exec -it mosquitto1 /usr/bin/mosquitto_passwd -b /data/passwd dev01 passw0rd
docker exec -it mosquitto1 /usr/bin/mosquitto_passwd -b /data/passwd app01 passw0rd
docker exec -it mosquitto1 /usr/bin/mosquitto_passwd -b /data/passwd app02 passw0rd
docker exec -it mosquitto1 /usr/bin/mosquitto_passwd -b /data/passwd app03 passw0rd
docker kill mosquitto1
docker rm mosquitto1
cp passwd data/mosquitto1/config/passwd
cp passwd data/mosquitto2/config/passwd
mv passwd data/mosquitto3/config/passwd

# create config file and copy to all 3 images
cp files/mosquitto.conf data/mosquitto1/config/mosquitto.conf
cp files/mosquitto.conf data/mosquitto2/config/mosquitto.conf
cp files/mosquitto.conf data/mosquitto3/config/mosquitto.conf

# run 3 brokers, named mosquitto1, mosquitto2 and mosquitto3
docker run -itd -v `pwd`/data/mosquitto1/config:/mosquitto/config -v `pwd`/data/mosquitto1/data:/mosquitto/data -v `pwd`/data/mosquitto1/log:/mosquitto/log --network brokers --name mosquitto1 $MOSQUITTO_IMAGE
docker run -itd -v `pwd`/data/mosquitto2/config:/mosquitto/config -v `pwd`/data/mosquitto2/data:/mosquitto/data -v `pwd`/data/mosquitto2/log:/mosquitto/log --network brokers --name mosquitto2 $MOSQUITTO_IMAGE
docker run -itd -v `pwd`/data/mosquitto3/config:/mosquitto/config -v `pwd`/data/mosquitto3/data:/mosquitto/data -v `pwd`/data/mosquitto3/log:/mosquitto/log --network brokers --name mosquitto3 $MOSQUITTO_IMAGE
