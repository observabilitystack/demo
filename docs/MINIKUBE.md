# MINIKUBE Setup

Currently, these demos are only tested in a MacOS development environment. We do not cover the basics of how to setup a dev machine, but we give some hints and links you might find helpful.

## Installation
To use Minikube on your machine, you have to install a hypervisor (We use [hyperkit][hyperkit]). You find detailed instructions about [installation][kubernetes-minikube-installation] and [quickstart][kubernetes-minikube-quickstart] on the Kubernetes site.

**Caution!** If you start minikube, it overwrites your Kubernetes config if you already have one! Make sure to backup `~/.kube/config` before you start minikube.

## Startup

To start your local **minikube** installation, use this command:

```
minikube start --vm-driver=hyperkit --memory 8192 --cpus 3
```

We use an Kubernetes ingress to access the Graylog UI via the web browser.
To enable ingresses in your minikube, use this command:

```
minikube addons enable ingress
```

## Kubernetes Dashboard

Although you can work with your Kubernetes cluster purely via the command line (`kubectl`), sometimes you might find a UI useful. To start a browser-based Dashboard UI:

```
minikube dashboard
```

## Special stunt for Elastic:

As described in the [official docs][elastic-virtual-memory-settings], ElasticSearch needs some special settings for virtual memory in the machine that it is running in.

One way to solve this is to `ssh` into the running minikube and set the value:

```
minikube ssh
```

when you're in the minikube shell:

```
sudo sysctl -w vm.max_map_count=262144
```

Unfortunately, you have to set this after every restart of the minikube.

Alternatively you can achieve this with an init container as described [here][elastic-virtual-memory-init-container].

[docker-macos-memory-settings]: https://docs.docker.com/docker-for-mac/#advanced
[kubernetes-minikube-installation]: https://kubernetes.io/docs/setup/minikube/#installation
[kubernetes-minikube-quickstart]: https://kubernetes.io/docs/setup/minikube/#quickstart
[hyperkit]: https://github.com/kubernetes/minikube/blob/master/docs/drivers.md#hyperkit-driver
[elastic-virtual-memory-settings]: https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
[elastic-virtual-memory-ssh-minikube]: https://github.com/kubernetes/minikube/issues/1306
[elastic-virtual-memory-init-container]: https://github.com/giantswarm/kubernetes-elastic-stack/blob/28e517da737065bbb700a963f64ea3e7838b2aed/manifests-all.yaml#L114
