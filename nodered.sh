#!/bin/bash

# deploy Node-RED instance to test brokers
mkdir data/nodered

cp files/flows.json data/nodered/flows.json
cp files/config.json data/nodered/.config.json
cp files/flows_cred.json data/nodered/flows_cred.json

docker run -itd -p 1880:1880 -v `pwd`/data/nodered:/data --network brokers --name nodered $NODERED_IMAGE
