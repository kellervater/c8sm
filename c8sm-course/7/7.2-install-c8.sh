#!/bin/bash

SCRIPTPATH=$(dirname "$(realpath "$0")")

. "${SCRIPTPATH}/../../settings.sh"


# 7.2.1
echo -n "🗂️  creating namespace $C8_NAMESPACE ... "
kubectl create namespace $C8_NAMESPACE 2>&1 | grep -q 'already exists' && echo -n "Namespace already exists. "
echo "DONE"

# 7.2.2
echo -n "🗝️  "
kubectl apply -n $C8_NAMESPACE -f $PATH_PLATFORM_LOCAL/modules/camunda-platform/secret.yaml

# 7.2.3
helm template camunda-platform camunda/camunda-platform --version $C8_VERSION --values $SCRIPTPATH/c8-helm-settings.yaml --skip-tests | kubectl apply -n $C8_NAMESPACE -f -

echo
