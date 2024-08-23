#!/bin/bash

# see: https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1807237

set -euo pipefail

SCRIPT_PATH="$(dirname "${BASH_SOURCE[0]}")"
REPO_PATH="$SCRIPT_PATH/../repos"

get_repo() {
  orga_repo=$1
  repo=$(echo "$orga_repo" | cut -d'/' -f2)
  repo_dir="$REPO_PATH/$repo"

  if [ -d "${repo_dir}" ]; then
    echo -n "🔄  pulling latest changes from ${repo}... "
    git -C "$repo_dir" pull
  else
    echo -n "📥  "
    git clone "git@github.com:$orga_repo.git" "$repo_dir"
  fi

}

get_repo camunda/camunda-platform-helm
get_repo camunda/camunda-platform-local
get_repo camunda-community-hub/camunda-8-helm-profiles

echo
