#!/bin/bash

CLUSTER_VERSION=$(jq -r '.features["ghcr.io/devcontainers/features/kubectl-helm-minikube"].version' .devcontainer/devcontainer.json)
CLUSTER_NAME=camunda-platform-local
