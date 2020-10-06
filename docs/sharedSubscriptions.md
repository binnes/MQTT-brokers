# Shared Subscriptions

Version 5 of the MQTT specification introduced shared subscriptions, although a number of brokers add their own shared subscription capability before the v5 of the MQTT standard was released.  

The MQTT v5 standard shared subscription works by pre-pending **$share/\<group\>/** to topic names.

Subscribing to the topic **$share/abc/test** means the client has subscribed to receive messages published to topic **test**, but in a shared subscription group named **abc**.

All clients using the same subscription group will belong to the same shared subscription, which results in only 1 client in the group receiving each published message to the subscribed topic.

## Why use shared subscriptions?

Shared subscriptions are really useful when the applications may to be scaled using horizontal scaling, where additional instances of an application are run and clients are load balanced between the instances.  Horizontal scaling is the standard mechanism used to scale workloads in cloud computing.  Applications can be scaled to cope with load and/or to ensure resilience.
