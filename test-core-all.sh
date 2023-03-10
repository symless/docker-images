#! /usr/bin/env bash

if [ "-h" = "${1:-}" ] || [ "--help" = "${1:-}" ]; then
  echo "${0}

Runs ./test-core.sh on all OS and VERSION's

Add filter parameters to only run some of the OS's

The resulting docker container will have the tag:

  \"symless/synergy-core:<OS><VERSION>\"

USAGE:
  ${0} [FILTER]
"
  exit 0
fi

docker container prune -f

function args_pairs() {
  for os in "$1"/*; do
    for version in "$os"/*; do
      if [ "ubuntu 16.04" = "$(basename $os) $(basename $version)" ]; then
        echo "$(basename $os) $(basename $version) -j1"
      else
        echo "$(basename $os) $(basename $version) -j"
      fi
    done
  done
}

args_pairs "./synergy-core" | grep "${*:-}" | xargs -n 3 ./test-core.sh