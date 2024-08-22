#!/bin/bash

CLUSTER_VERSION=$(cat .tool-versions | grep kubectl | cut -d" " -f2)
CLUSTER_NAME=camunda-platform-local
