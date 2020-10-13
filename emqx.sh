#!/bin/bash

# Deploy EMQ X brokers - create a cluster of 3 nodes
mkdir -p data/emqx1
mkdir -p data/emqx2
mkdir -p data/emqx3

# Create config files
cp files/emqx.conf data/emqx1/emqx.conf
cp files/emqx.conf data/emqx2/emqx.conf 
cp files/emqx.conf data/emqx3/emqx.conf

# Allow all access control permissions
cp files/emqx-acl.conf data/emqx1/acl.conf
cp files/emqx-acl.conf data/emqx2/acl.conf 
cp files/emqx-acl.conf data/emqx3/acl.conf


docker run -itd -e EMQX_NAME=emqx1 -e EMQX_HOST=emqx1.docker -v `pwd`/data/emqx1/emqx.conf:/opt/emqx/etc/emqx.conf -v `pwd`/data/emqx1/acl.conf:/opt/emqx/etc/acl.conf --network brokers --name emqx1.docker $EMQX_IMAGE
docker run -itd -e EMQX_NAME=emqx2 -e EMQX_HOST=emqx2.docker -v `pwd`/data/emqx2/emqx.conf:/opt/emqx/etc/emqx.conf -v `pwd`/data/emqx2/acl.conf:/opt/emqx/etc/acl.conf --network brokers --name emqx2.docker $EMQX_IMAGE 
docker run -itd -e EMQX_NAME=emqx3 -e EMQX_HOST=emqx3.docker -v `pwd`/data/emqx3/emqx.conf:/opt/emqx/etc/emqx.conf -v `pwd`/data/emqx3/acl.conf:/opt/emqx/etc/acl.conf --network brokers --name emqx3.docker $EMQX_IMAGE  