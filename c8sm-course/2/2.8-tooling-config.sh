#!/bin/bash

# see https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1807240

set -euo pipefail

SCRIPT_PATH="$(dirname "${BASH_SOURCE[0]}")"
HELM_PATH="$SCRIPT_PATH/../repos/camunda-platform-helm"

make -C "$HELM_PATH" helm.repos-add
make -C "$HELM_PATH" helm.dependency-update

echo
