#! /usr/bin/env bash

if [ -z "${1:-}" ] || [ -z "${2:-}" ] || [ "-h" = "${1:-}" ] || [ "--help" = "${1:-}" ]; then
  echo "${0}

Create docker container then build synergy-core

USAGE:
  ${0} OS VERSION [OPTIONS]

OPTIONS:
  -j [jobs], --jobs[=jobs]
    Specifies  the  number  of jobs (commands) to run simultaneously.
    If there is more than one -j option, the last one is effective.
    If the -j option is given without an argument, make will not
    limit the number of jobs that can run simultaneously.
"
  exit 0
fi

# exit when any command fails
set -euxo pipefail

# echo an error message before exiting
trap 'echo "\"${BASH_COMMAND}\" command filed with exit code $?."' DEBUG

mkdir -p output

./build-core.sh "$1" "$2" |& tee "./output/synergy-core-$1$2.txt"
./make-core.sh "$1" "$2" "${3:-"-j"}" |& tee -a "./output/synergy-core-$1$2.txt"
