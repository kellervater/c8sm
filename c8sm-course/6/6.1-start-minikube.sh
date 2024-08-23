#!/bin/bash

# see https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1809719

set -eo pipefail

. "$(dirname "$(realpath "$0")")/../../settings.sh"

echo "▶️  Starting minikube (v$CLUSTER_VERSION) as ${CLUSTER_NAME} ..."

minikube start \
  --addons=ingress \
  --driver=docker \
  --kubernetes-version="${CLUSTER_VERSION}" \
  --namespace="${C8_NAMESPACE}" \
  --ports=80:80 --ports=443:443 \
  --profile=$CLUSTER_NAME \
  --force

echo
