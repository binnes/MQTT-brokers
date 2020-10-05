@echo off

set "MOSQUITTO_IMAGE=eclipse-mosquitto:1.6.12"
set "EMQX_IMAGE=emqx/emqx:4.2.0"
set "RABBITMQ_IMAGE=rabbitmq:3.8.9"
set "NODERED_IMAGE=nodered/node-red"

mkdir data

docker network create brokers

call mosquitto
call emqx
call rabbitMQ
call nodered