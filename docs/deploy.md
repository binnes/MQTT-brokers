# Deploying the brokers

The scripts in this repository should allow you to setup the 3 brokers, so you can experiment and test the various brokers options and configurations.

## Prerequisites

The scripts provided rely on Docker, so you need to have an up to date version of [Docker](https://www.docker.com/get-started) installed on your system.

The scripts provided have been tested on up to date versions of Linux (using bash shell), MacOS and Windows 10 (using Command prompt)

This project assumes you know the basics of MQTT, it is not an MQTT tutorial.

## Running the scripts

The deploy script will setup a Docker network then deploy 3 instances of each of the brokers included in the test.  For EMQX and Rabbit MQ the brokers will be configured as a cluster.

![Broker Setup](images/brokerSetup.png){style="width: 80%" .center}

A Node-RED instance is then deployed with a test flow added.  This Node-RED flow allows you to test each of the broker configurations, as there are 2 connections made to each of the 3 instances of broker.  Where the broker supports shared subscriptions, the Node-RED node will create a shared subscription.

![Node-RED flow](images/node-red-flow.png){style="width: 80%" .center}

Each box represents 1 broker, and each of the MQTT-in nodes has their own connection to a broker, with a subscription to the **test** topic

The Inject nodes publishes a message to the **test** topic on the connected broker and the debug nodes allow you to see which MQTT clients received that message.

### Running the test

To run the test simply run deploy.sh (on Linux or MacOS) in a terminal window or deploy.bat (on Windows) in a command window.

This will deploy the brokers and Node-RED as Docker containers.

### Accessing Node-RED

To access the Node-RED user interface you can launch a browser on the same system running the Docker containers and browse to [http://localhost:1880](http://localhost:1880){target=_blank}

### Tidying up

Once you have completed the testing you can run the cleanup.sh or cleanup.bat script to delete all the containers and the Docker network configuration.

!!! Warning
    If you made any changes to the Node-RED flow, then running the cleanup script will delete the container and you will loose the modified Node-RED flow
