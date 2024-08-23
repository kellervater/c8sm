#!/bin/bash

# see https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1809719

set -euo pipefail

SCRIPT_PATH="$(dirname "${BASH_SOURCE[0]}")"
# shellcheck source=/dev/null
. "$SCRIPT_PATH/../../settings.sh"

MINIKUBE_STATUS=$(minikube status -p "$CLUSTER_NAME" > /dev/null) || MINIKUBE_STATUS=$?

if [[ $MINIKUBE_STATUS -eq 85 ]]; then
  echo "🤷  Minikube cluster '${CLUSTER_NAME}' not found."
elif [[ $MINIKUBE_STATUS -eq 7 ]]; then
  echo "🛑  Minikube cluster '${CLUSTER_NAME}' stopped."
else
  echo "🚴  Minikube cluster '${CLUSTER_NAME}' already running."
  exit 0
fi


echo "▶️   Starting minikube ($CLUSTER_VERSION) as ${CLUSTER_NAME} ..."
minikube start \
  --addons=ingress \
  --driver=docker \
  --kubernetes-version="${CLUSTER_VERSION}" \
  --namespace="${C8_NAMESPACE}" \
  --ports=80:80 --ports=443:443 \
  --profile="${CLUSTER_NAME}" \
  --force

echo
