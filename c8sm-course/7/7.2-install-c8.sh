#!/bin/bash

# see https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1809730

set -euo pipefail

SCRIPT_PATH=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
# shellcheck source=/dev/null
. "${SCRIPT_PATH}/../../settings.sh"

VALUES_FILE=${1:-"${SCRIPT_PATH}/c8-helm-settings.yaml"}

# 7.2.1
echo -n "🗂️  creating namespace $C8_NAMESPACE ... "
kubectl create namespace "$C8_NAMESPACE" 2>&1 | grep -q 'already exists' && echo -n "Namespace already exists. "
echo "DONE"

# 7.2.2
echo -n "🗝️  "
kubectl apply -n "$C8_NAMESPACE" -f "$PATH_PLATFORM_LOCAL/modules/camunda-platform/secret.yaml"

# 7.2.3
helm template camunda-platform camunda/camunda-platform --version "$C8_VERSION" --values "${VALUES_FILE}" --skip-tests | kubectl apply -n "$C8_NAMESPACE" -f -

echo
