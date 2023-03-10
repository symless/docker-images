#! /usr/bin/env bash

if [ -z "${1:-}" ] || [ -z "${2:-}" ] || [ "-h" = "${1:-}" ] || [ "--help" = "${1:-}" ]; then
  echo "${0}

Build synergy-core based using the docker container tagged:

  \"symless/synergy-core:<OS><VERSION>\"

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

rm -rf "./output/synergy-core/$1/$2"
mkdir -p "./output/synergy-core/$1/$2"

PARALLEL="$([ -z "${3:-}" ] && echo "-j" || echo "$3" )"

BUILD_CMD="
git clone --recursive https://github.com/symless/synergy-core.git
cd synergy-core
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
. ./version
make $PARALLEL
./bin/unittests
cp ./bin/* /output/bin/
"

docker run --rm \
  -v "$(pwd)/output/synergy-core/$1/$2":/output/bin:rw \
  "symless/synergy-core:$1$2" \
  /bin/bash -c "$BUILD_CMD"
