#!/bin/bash

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

CLUSTER_VERSION=$(jq -r '.features["ghcr.io/devcontainers/features/kubectl-helm-minikube"].version' $SCRIPT_DIR/.devcontainer/devcontainer.json)
CLUSTER_NAME=camunda-platform-local

C8_NAMESPACE=camunda-platform
C8_VERSION=8.3.0

DNS_ENTRIES=(local.distro.ultrawombat.com zeebe.local.distro.ultrawombat.com)

PATH_PLATFORM_LOCAL=$SCRIPT_DIR/c8sm-course/repos/camunda-platform-local
