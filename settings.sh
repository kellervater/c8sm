#!/bin/bash

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

export C8_NAMESPACE=camunda-platform
export C8_VERSION=8.3.0

export CLUSTER_NAME=camunda-platform-local
CLUSTER_VERSION=$(grep -m 1 KUBERNETES_VERSION .devcontainer/Dockerfile | cut -d"=" -f2 | cut -d" " -f1)
export CLUSTER_VERSION

export DNS_ENTRIES=(local.distro.ultrawombat.com zeebe.local.distro.ultrawombat.com)

export MINIKUBE_CPUS=4
export MINIKUBE_MEM=6144m


export PATH_PLATFORM_LOCAL="$SCRIPT_DIR/c8sm-course/repos/camunda-platform-local"
