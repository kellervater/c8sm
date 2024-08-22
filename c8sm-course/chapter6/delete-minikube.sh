#!/bin/bash

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname "$SCRIPT")

. "${SCRIPTPATH}/settings.sh"

minikube delete \
  --profile=$CLUSTER_NAME
