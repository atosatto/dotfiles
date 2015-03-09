#!/bin/bash

set -e

NPM_OSX=(
    ios-sim
)

echo "  Installing osx-specific global npm dependencies."

for glob in ${NPM_OSX[@]}
do
    sudo npm install -g $glob
done
