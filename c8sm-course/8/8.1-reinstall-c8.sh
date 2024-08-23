#!/bin/bash

# see https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1810195#

set -euo pipefail

SCRIPT_PATH=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
# shellcheck source=/dev/null
. "${SCRIPT_PATH}/../../settings.sh"

"$SCRIPT_PATH/../7/7.2-install-c8.sh" "${SCRIPT_PATH}/values.yaml"
