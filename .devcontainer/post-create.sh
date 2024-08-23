#!/bin/bash

# This compound script is intended to be run as `postCreateCommand` in a devcontainer.
# It is reponsible for executing commands at container runtime

set -eo pipefail

# Fix dubios ownership
git config --global --add safe.directory /workspaces/c8sm

# activate pre-commit hooks
pre-commit install
