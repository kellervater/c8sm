#!/bin/bash

# This compound script is intended to be run as `postCreateCommand` in a devcontainer.
# It installs all packages defined in `.tool-versions` AND
# sets useful 
# installs everything asdf is not able to cover

set -eo pipefail

# Fix dubios ownership
git config --global --add safe.directory /workspaces/c8sm

# asdf stuff
# run first one twice since it'll always fail first time (didn't bother looking up problem yet)
make asdf-plugins || make asdf-plugins
make asdf-install

# kubectl code completion
echo -n "Enabling kubectl (alias: k) code completion... "
source <(kubectl completion bash) # set up autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.
echo "alias kubectl=kubecolor" # colorize kubectl output
echo "alias k=kubectl" >> ~/.bashrc # create kubectl alias
echo "DONE"

# zbctl
npm i -g zbctl
