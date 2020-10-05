@echo off

docker kill mosquitto1
docker kill mosquitto2
docker kill mosquitto3
docker kill emqx1.docker
docker kill emqx2.docker
docker kill emqx3.docker
docker kill rabbitMQ1
docker kill rabbitMQ2
docker kill rabbitMQ3
docker kill nodered
docker rm mosquitto1
docker rm mosquitto2
docker rm mosquitto3
docker rm emqx1.docker
docker rm emqx2.docker
docker rm emqx3.docker
docker rm rabbitMQ1
docker rm rabbitMQ2
docker rm rabbitMQ3
docker rm nodered
docker network rm brokers
rmdir /s  /q data
