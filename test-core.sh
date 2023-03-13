#! /usr/bin/env bash

JOBS="1"
BRANCH="master"

usage() { echo "
Create docker container then build synergy-core

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
    j) JOBS=$OPTARG;;
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

# echo an error message before exiting
trap 'echo "\"${BASH_COMMAND}\" command filed with exit code $?."' DEBUG

mkdir -p output

./build-core.sh "$OS" "$VERSION" |& tee "./output/synergy-core-$OS$VERSION.txt"
./make-core.sh -j "$JOBS" -b "$BRANCH" "$OS" "$VERSION" |& tee -a "./output/synergy-core-$OS$VERSION.txt"
