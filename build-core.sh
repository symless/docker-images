#! /usr/bin/env bash

usage() { echo "
Build one of the synergy-core builder dockerfiles into a docker container.
The resulting docker container will have the tag:

  \"symless/synergy-core:<OS><VERSION>\"

USAGE:
  $0 [OPTIONS] OS VERSION

OPTIONS:
  -h
    Prints this usage text.
"
  exit 1
}

if [ -z "$*" ]; then
  usage
fi

while getopts "h" flag; do
  case "$flag" in
    *) usage;;
  esac
done

OS="${@:$OPTIND:1}"
VERSION=${@:$OPTIND+1:1}

echo -e "
ARGUMENTS:
  OS:      $OS
  VERSION: $VERSION
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

docker build -t "symless/synergy-core:$OS$VERSION" - < "./synergy-core/$OS/$VERSION/Dockerfile"
