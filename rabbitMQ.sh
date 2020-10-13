#!/bin/bash

# Rabbit MQ

mkdir -p data/rabbitMQ
mkdir data/rabbitMQ/lib1
mkdir data/rabbitMQ/lib2
mkdir data/rabbitMQ/lib3

cp files/rabbitmq.conf data/rabbitMQ/rabbitmq.conf
cp files/enabled_plugins data/rabbitMQ/enabled_plugins

docker run -itd -e RABBITMQ_ERLANG_COOKIE='rabbitMQ_cooKie' -p 15672:15672 -v `pwd`/data/rabbitMQ/enabled_plugins:/etc/rabbitmq/enabled_plugins -v `pwd`/data/rabbitMQ/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf -v `pwd`/data/rabbitMQ/lib1:/var/lib/rabbitmq --network brokers --hostname rabbitMQ1 --name rabbitMQ1 $RABBITMQ_IMAGE
docker run -itd -e RABBITMQ_ERLANG_COOKIE='rabbitMQ_cooKie' -v `pwd`/data/rabbitMQ/enabled_plugins:/etc/rabbitmq/enabled_plugins -v `pwd`/data/rabbitMQ/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf -v `pwd`/data/rabbitMQ/lib2:/var/lib/rabbitmq --network brokers --hostname rabbitMQ2 --name rabbitMQ2 $RABBITMQ_IMAGE
docker run -itd -e RABBITMQ_ERLANG_COOKIE='rabbitMQ_cooKie' -v `pwd`/data/rabbitMQ/enabled_plugins:/etc/rabbitmq/enabled_plugins -v `pwd`/data/rabbitMQ/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf -v `pwd`/data/rabbitMQ/lib3:/var/lib/rabbitmq --network brokers --hostname rabbitMQ3 --name rabbitMQ3 $RABBITMQ_IMAGE