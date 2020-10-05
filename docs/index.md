MQTT Brokers

Choosing a broker for an MQTT based project can be difficult, as there are many choices available and a number of features which can impact the design and implementation of a solution to fit a specific broker feature set.

This project aims to look at some features which can impact application design and implementation.  Be aware, there are also many operational considerations which need to be taken into account when selecting a broker.

This project will only use Open Source brokers to allow developers to further explore the brokers and features without incurring costs, but the findings can be applied to commercial offerings.

Some of the features to be explored are:

- Scalability for resilience (cluster / bridge strategy)
- Shared subscriptions
- Security features (user password, server TLS certificate, client TLS certificates)
- Bridge to other brokers (same and different broker types)

## Brokers to be considered

The following brokers will be used throughout this project, as they represent a selection of brokers with different combination of capabilities.

- [Mosquitto](https://mosquitto.org/)
- [EMQ X](https://www.emqx.io/)
- [RabbitMQ](https://www.rabbitmq.com)

## Test environment

Although the eventual target environment is a Kubernetes based system, the initial testing will be done using Docker.

Docker images used in test:

| Broker | image | Architectures available| Clustered | Shared Subscriptions |
|--------|-------|------------------------|-----------|----------------------|
| Mosquitto |eclipse-mosquitto:1.6.12 | linux/386, linux/amd64, linux/arm/v6, linux/arm64/v8, linux/ppc64le, linux/s390x | No | Yes |
| EMQ X | emqx/emqx:4.2.0 | linux/386, linux/amd64, linux/arm/v7, linux/arm64/v8, linux/s390x | Yes | Yes |
| rabbitMQ | rabbitmq:3.8.9 | linux/386, linux/amd64, linux/arm/v7, linux/arm64/v8, linux/ppc64le, linux/s390x | Yes | No |

The test was done on an Intel i9 CPU, so the linux/amd64 architecture container images were used, but the table above shows the available architectures available on Docker Hub.

## 
