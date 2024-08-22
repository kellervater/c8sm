#!/bin/bash

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname "$SCRIPT")

. "${SCRIPTPATH}/../settings.sh"

minikube start \
  --kubernetes-version="${CLUSTER_VERSION}" \
  --ports=80:80 --ports=443:443 \
  --addons=ingress \
  --force
