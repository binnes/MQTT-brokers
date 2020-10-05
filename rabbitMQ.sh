#!/bin/bash

# Rabbit MQ

mkdir -p data/rabbitMQ

cp files/rabbitmq.conf data/rabbitMQ/rabbitmq.conf
cp files/enabled_plugins data/rabbitMQ/enabled_plugins

docker run -itd -e RABBITMQ_ERLANG_COOKIE='rabbitMQ_cooKie' -p 15672:15672 -v `pwd`/data/rabbitMQ/enabled_plugins:/etc/rabbitmq/enabled_plugins -v `pwd`/data/rabbitMQ/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf --network brokers --hostname rabbitMQ1 --name rabbitMQ1 $RABBITMQ_IMAGE
docker run -itd -e RABBITMQ_ERLANG_COOKIE='rabbitMQ_cooKie' -v `pwd`/data/rabbitMQ/enabled_plugins:/etc/rabbitmq/enabled_plugins -v `pwd`/data/rabbitMQ/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf --network brokers --hostname rabbitMQ2 --name rabbitMQ2 $RABBITMQ_IMAGE
docker run -itd -e RABBITMQ_ERLANG_COOKIE='rabbitMQ_cooKie' -v `pwd`/data/rabbitMQ/enabled_plugins:/etc/rabbitmq/enabled_plugins -v `pwd`/data/rabbitMQ/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf --network brokers --hostname rabbitMQ3 --name rabbitMQ3 $RABBITMQ_IMAGE