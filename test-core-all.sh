#! /usr/bin/env bash

JOBS="1"
BRANCH="master"
FILTER=""

usage() { echo "
Runs ./test-core.sh on all OS and VERSION's
Add filter parameters to only run some of the OS's
The resulting docker container will have the tag:

  \"symless/synergy-core:<OS><VERSION>\"

USAGE:
  $0 [OPTIONS] [FILTER]

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

while getopts "hj:b:" flag; do
  case "$flag" in
    j) JOBS=$OPTARG;;
    b) BRANCH=$OPTARG;;
    *) usage;;
  esac
done

FILTER=${@:$OPTIND}

echo -e "
ARGUMENTS:
  FILTER: $FILTER

OPTIONS:
  BRANCH: $BRANCH
"

docker container prune -f

function args_pairs() {
  for os in "$1"/*; do
    for version in "$os"/*; do
      if [ "ubuntu 16.04" = "$(basename "$os") $(basename "$version")" ]; then
        echo "-j 1 $(basename "$os") $(basename "$version")"
      else
        echo "-j $JOBS $(basename "$os") $(basename "$version")"
      fi
    done
  done
}

args_pairs "./synergy-core" | grep "$FILTER" | xargs -L1 ./test-core.sh -b "$BRANCH"
