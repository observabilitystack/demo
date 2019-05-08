#!/bin/bash
set -e

echo
echo "Step 1:"
echo
echo "Your turn: Start logging stack by applying Kubernetes definitions to your local minikube!"
echo
read -p "Hit ENTER when you're done!"

echo
echo "Step 2:"
echo
echo "Wait for Graylog to be up and running ..."
echo

graylog_health_rc=-1
while [ ! $graylog_health_rc -eq 0 ]
do
  set +e
  graylog_health=$(curl -sS --request GET \
    --url http://local.o12stack.org/api)
  graylog_health_rc=$?
  set -e
  sleep 5
done

echo
echo "Graylog is up and running!"
echo
echo "Step 3:"
echo
echo "Configure GELF UDP input in Graylog ..."
echo
graylog_configure_input=$(curl -sS --request POST \
  --url http://local.o12stack.org/api/system/inputs \
  --header 'authorization: Basic YWRtaW46YWRtaW4=' \
  --header 'content-type: application/json' \
  --header 'x-requested-by: logging-demo' \
  --data '{
  "title": "gelf-tcp",
  "type": "org.graylog2.inputs.gelf.tcp.GELFTCPInput",
  "configuration": {
    "bind_address": "0.0.0.0",
    "port": 12201
  },
  "global": true
}')

if [ $? -eq 0 ]
then
  echo "Graylog GELF TCP input configured successfully."
  echo
  echo "see http://local.o12stack.org (admin/admin)"
  echo
else
  echo "Error configuring GELF UDP input in Graylog:"
  echo
  echo $graylog_configure_input
fi
