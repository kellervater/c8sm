#!/bin/bash

# see https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1809719

set -eo pipefail

. "$(dirname "$(realpath "$0")")/../../settings.sh"

minikube stop \
  --profile=$CLUSTER_NAME

echo
