#!/bin/bash

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname "$SCRIPT")

. "${SCRIPTPATH}/settings.sh"

minikube start \
  --addons=ingress \
  --driver=docker \
  --kubernetes-version="${CLUSTER_VERSION}" \
  --ports=80:80 --ports=443:443 \
  --profile=$CLUSTER_NAME \
  --force
