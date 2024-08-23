#!/bin/bash

set -eo pipefail

. "$(dirname "$(realpath "$0")")/../../settings.sh"

for entry in "${DNS_ENTRIES[@]}"; do
  echo -n "🕵️‍♂️  checking ip for ${entry} ... "
  if ! dig +short ${entry} | grep '127.0.0.1' ; then
    echo -e "\n🛑  ${entry} doesn't point to localhost!"
    echo "🗒️   Try checking documentation: https://employee-academy.camunda.com/c8-self-managed-using-c8-helm-chart/1809724"
    echo "🚪  exiting ..."
    exit 1
  fi
done

echo
