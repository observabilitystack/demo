# Logging Demo Stack

In this repo, you find a demo that builds an open source logging stack in Kubernetes using Filebeat, Logstash, Graylog and ElasticSearch.

The logging stack is set up in a `minikube` environment and logs from different sources (test drivers) are fired into it.

## The Logging Stack

The logging stack consists of these components:

![The Logging Stack](docs/FelgStack.png)

* The "ELG" stack
  * running inside the Kubernetes deployment `elg-deployment`
  * `logstash` filters and enriches log records
  * `graylog` manages the indexes and provides a search and management UI
  * `elastic` stores the log records in indexes
  * `mongo`is a Mongo DB that stores metadata for Graylog

* Filebeat
  * running inside a Kubernetes daemonset `filebeat-daemonset` 
  * The daemonset ensures that exactly one pod is running per Kubernetes node (and accordingly one per Docker daemon)
  * `filebeat` reads the Docker outputs of a subset of the running containers of a Kubernetes node

* Communication and Services
  * `logstash` offers a `beats` protocol Kubernetes service listening on port `5044`. A corresponding `NodePort` makes the service available for non-Kubernetes applications. The latter is not shown in this demo.
  * `graylog` offers a `gelf` input service to ingest the logs into the index.
  * On the other hand, `graylog` gives access to its web UI via a service. The corresponding `NodePort` makes sure that you can access the UI from the outside.
  * The services offered by `elastic` were only used for troubleshooting and exploration, their usage is not shown in the demo.

## The Log Message Flow

![The Log Message Flow](docs/LogFlow.png)

Three demo applications ("test drivers") can shoot their logs into the stack at a desired rate. They write their logs to `stdout` where they are captured by the Docker daemon. 

`filebeat` reads the log lines from the Docker log storage and fires them into the pipeline.

## Setup

[Here](docs/MINIKUBE.md) you find the documentation how you set up your dev machine for the demos.

## Running the demo

TODO, sub-document

## Annotations, fields and log formats

TODO, sub-document

## Resources

[Here](docs/LINKS.md) you find some links to docs we found useful while developing this demo.
