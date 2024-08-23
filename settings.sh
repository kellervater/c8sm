#!/bin/bash

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

CLUSTER_VERSION=$(cat .devcontainer/Dockerfile | grep -m 1 KUBERNETES_VERSION | cut -d"=" -f2 | cut -d" " -f1)
CLUSTER_NAME=camunda-platform-local

C8_NAMESPACE=camunda-platform
C8_VERSION=8.3.0

DNS_ENTRIES=(local.distro.ultrawombat.com zeebe.local.distro.ultrawombat.com)

PATH_PLATFORM_LOCAL=$SCRIPT_DIR/c8sm-course/repos/camunda-platform-local
