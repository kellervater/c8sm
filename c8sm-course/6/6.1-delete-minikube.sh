#!/bin/bash

# see https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1809719

set -euo pipefail

SCRIPT_PATH="$(dirname "${BASH_SOURCE[0]}")"
# shellcheck source=/dev/null
. "$SCRIPT_PATH/../../settings.sh"

minikube delete \
  --profile="$CLUSTER_NAME"

echo
