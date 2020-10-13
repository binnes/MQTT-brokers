# Clustered MQTT Brokers

Clustering is a mechanism to spread a broker over multiple systems.  There are a number of MQTT brokers available that support clustering.

With the introduction of cloud infrastructure deployments models are changing.  In more traditional hosting environments, some infrastructure components were vertically scaled using large server machines, redundant or specialist hardware, but with cloud there is a move to standardised, commodity hardware with horizontal scalability used to deliver increased load and resilience of applications and services.

A clustered broker behaves like a single broker, with published messages being delivered to all clients with an appropriate subscription, no matter which cluster member they are connected to.  

Clustered brokers allow a broker to be deployed to cloud infrastructure and some clustered brokers have built in features to support deployment and configuration within a Kubernetes environment.

One key advantage of using a clustered broker is that it removes the single point of failure from a solution.  If a cluster member fails then the other members of the cluster still continue working and client that were connected to the failed broker are able to immediately reconnect to one of the working cluster members.

Most clustered brokers have intelligent routing, where all messages do not need to be sent to all cluster members.  Only cluster members with a client subscription matching a message topic will be sent the message to forward to subscribed clients.

In the test setup both the EMQX and RabbitMQ brokers support clustering.

When looking at different clustered brokers there are differences with the internal routing of messages and how the failure of a cluster member is handled, so you do need to understand the functional and non-functional requirements you need from a broker.
