#!/usr/bin/env bash

set -e

platform="unknown"
if [[ "$(uname)" == "Darwin" ]]; then
   platform="osx"
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
   platform="linux"
fi

for script in $(find . -name $platform.sh)
do
  "${script}"
done

for script in $(find . -name all.sh)
do
  "${script}"
done
