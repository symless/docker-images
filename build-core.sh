#! /usr/bin/env bash

if [ -z "${1:-}" ] || [ -z "${2:-}" ] || [ "-h" = "${1:-}" ] || [ "--help" = "${1:-}" ]; then
  echo "${0}

Build one of the synergy-core builder dockerfiles into a docker container.
The resulting docker container will have the tag:

  \"symless/synergy-core:<OS><VERSION>\"

USAGE:
  ${0} OS VERSION
"
  exit 0
fi

# exit when any command fails
set -euxo pipefail

docker build -t "symless/synergy-core:$1$2" - < "./synergy-core/$1/$2/Dockerfile"
