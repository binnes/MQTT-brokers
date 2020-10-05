#!/bin/bash

MOSQUITTO_IMAGE=eclipse-mosquitto:1.6.12
EMQX_IMAGE=emqx/emqx:4.2.0
RABBITMQ_IMAGE=rabbitmq:3.8.9
NODERED_IMAGE=nodered/node-red

docker network create brokers

. ./mosquitto.sh
. ./emqx.sh
. ./rabbitMQ.sh
. ./nodered.sh