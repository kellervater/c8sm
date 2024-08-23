#!/bin/bash

# see https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1809719

set -euo pipefail

SCRIPT_PATH="$(dirname "${BASH_SOURCE[0]}")"
# shellcheck source=/dev/null
. "$SCRIPT_PATH/../../settings.sh"

minikube stop \
  --profile="$CLUSTER_NAME" || [[ $? -eq 85 ]] # cluster not found is ok here.

echo
