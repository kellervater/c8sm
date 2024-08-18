#!/bin/bash

# see: https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1807237

REPO_PATH="$(dirname "$(realpath "$0")")/../repos"

get_repo() {
  local orga_repo=$1
  local orga=$(echo "$orga_repo" | cut -d'/' -f1)
  local repo=$(echo "$orga_repo" | cut -d'/' -f2)
  local repo_dir="$REPO_PATH/$repo"

  if [ -d "${repo_dir}" ]; then
    echo -ne "🔄\tpulling latest changes from ${repo}... "
    git -C "$repo_dir" pull
  else
    echo -ne "📥\t "
    git clone "git@github.com:$orga_repo.git" "$repo_dir"
  fi
  
}

get_repo camunda/camunda-platform-helm
get_repo camunda/camunda-platform-local
get_repo camunda-community-hub/camunda-8-helm-profiles
