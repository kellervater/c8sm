#!/bin/bash

# see https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1807240

set -eo pipefail

HELM_PATH="$(dirname "$(realpath "$0")")/../repos/camunda-platform-helm"
CURRENT_PATH=$(pwd)

cd $HELM_PATH
make helm.repos-add
make helm.dependency-update
cd $CURRENT_PATH

echo
