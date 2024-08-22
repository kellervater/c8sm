#!/bin/bash

SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname "$SCRIPT")

. "${SCRIPTPATH}/settings.sh"

minikube stop \
  --profile=$CLUSTER_NAME
