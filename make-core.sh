#! /usr/bin/env bash

JOBS=""
BRANCH="master"

usage() { echo "
Build synergy-core based using the docker container tagged:

  \"symless/synergy-core:<OS><VERSION>\"

USAGE:
  $0 [OPTIONS] OS VERSION

OPTIONS:
  -h
    Prints this usage text.
  -j JOBS
    Specifies the number of jobs (commands) to run simultaneously.
    If the argument is a '-' then it is treated as having no limit
    to the number of simultaneous jobs.
  -b BRANCH_NAME
    Specifies the branch. Defaults to 'master'.
"
  exit 1
}

if [ -z "$*" ]; then
  usage
fi

while getopts "hj:b:" flag; do
  case "$flag" in
    j)
      if [ "-" = "$OPTARG" ]; then
        JOBS="-j"
      else
        JOBS="-j $OPTARG"
      fi
    ;;
    b) BRANCH=$OPTARG;;
    *) usage;;
  esac
done

OS="${@:$OPTIND:1}"
VERSION=${@:$OPTIND+1:1}

echo -e "
ARGUMENTS:
  OS:      $OS
  VERSION: $VERSION

OPTIONS:
  JOBS:    $JOBS
  BRANCH:  $BRANCH
"
if [ -z $OS ]; then
  echo "The OS parameter is required!"
  usage
fi

if [ -z $VERSION ]; then
  echo "The VERSION parameter is required!"
  usage
fi

# exit when any command fails
set -euxo pipefail

rm -rf "./output/synergy-core/$OS/$VERSION"
mkdir -p "./output/synergy-core/$OS/$VERSION"

BUILD_CMD="
git clone --recursive ${BRANCH:+-b "$BRANCH"} https://github.com/symless/synergy-core.git
cd synergy-core
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
. ./version
make $JOBS
./bin/unittests
cp ./bin/* /output/bin/
"

docker run --rm \
  -v "$(pwd)/output/synergy-core/$OS/$VERSION":/output/bin:rw \
  "symless/synergy-core:$OS$VERSION" \
  /bin/bash -c "$BUILD_CMD"
