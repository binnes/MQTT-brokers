REM Rabbit MQ
@echo off

mkdir data\rabbitMQ

copy files\enabled_plugins data\rabbitMQ\enabled_plugins
copy files\rabbitmq.conf data\rabbitMQ\rabbitmq.conf

docker run -itd -e RABBITMQ_ERLANG_COOKIE='rabbitMQ_cooKie' -p 15672:15672 -v %cd%\data\rabbitMQ\enabled_plugins:/etc/rabbitmq/enabled_plugins -v %cd%\data\rabbitMQ\rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf --network brokers --hostname rabbitMQ1 --name rabbitMQ1 %RABBITMQ_IMAGE%
docker run -itd -e RABBITMQ_ERLANG_COOKIE='rabbitMQ_cooKie' -v %cd%\data\rabbitMQ\enabled_plugins:/etc/rabbitmq/enabled_plugins -v %cd%\data\rabbitMQ\rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf --network brokers --hostname rabbitMQ2 --name rabbitMQ2 %RABBITMQ_IMAGE%
docker run -itd -e RABBITMQ_ERLANG_COOKIE='rabbitMQ_cooKie' -v %cd%\data\rabbitMQ\enabled_plugins:/etc/rabbitmq/enabled_plugins -v %cd%\data\rabbitMQ\rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf --network brokers --hostname rabbitMQ3 --name rabbitMQ3 %RABBITMQ_IMAGE%