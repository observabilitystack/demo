# Resources and links

Some sources we did find useful while building this demo which are not being referred to elsewhere in these docs:

* GELF: https://docs.docker.com/config/containers/logging/gelf/
* Docker networks: https://docs.docker.com/compose/networking/#using-a-pre-existing-network
* Graylog input via REST API: https://stackoverflow.com/a/40110324
* Docker in Minikube: https://blog.hasura.io/sharing-a-local-registry-for-minikube-37c7240d0615 (good read to learn how things work)
* Open a shell on a running container inside Kubernetes: https://kubernetes.io/docs/tasks/debug-application-cluster/get-shell-running-container/#opening-a-shell-when-a-pod-has-more-than-one-container
* containerPort: https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/
* Kubernetes volumes: https://kubernetes.io/docs/concepts/storage/volumes/
* Filebeat Docker input: https://www.elastic.co/guide/en/beats/filebeat/current/filebeat-input-docker.html
* Filebeat auto discover: https://www.elastic.co/guide/en/beats/filebeat/current/configuration-autodiscover.html
* Kubernetes Role-based access control (RBAC): https://kubernetes.io/docs/reference/access-authn-authz/rbac/
* Engineering Blog post from elastic about hint-based auto discovery: https://www.elastic.co/blog/docker-and-kubernetes-hints-based-autodiscover-with-beats
* Elastic dosc on hint-based auto discovery: https://www.elastic.co/guide/en/beats/filebeat/current/configuration-autodiscover-hints.html
* Manage multiline messages: https://www.elastic.co/guide/en/beats/filebeat/current/multiline-examples.html
* Access Docker Daemon in Minikube: https://kubernetes.io/docs/setup/minikube/#use-local-images-by-re-using-the-docker-daemon
* Grok Debugger: https://grokdebug.herokuapp.com/
* Grok Patterns: https://github.com/logstash-plugins/logstash-patterns-core/blob/master/patterns/grok-patterns
* Running Minikube with vm driver 'none': https://medium.com/@nieldw/running-minikube-with-vm-driver-none-47de91eab84c
