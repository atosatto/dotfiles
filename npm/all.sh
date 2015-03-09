#!/bin/bash

set -e

NPM_GLOBALS=(
    cordova
    ionic
)

echo "  Installing multi-platform global npm dependencies."

for glob in ${NPM_GLOBALS[@]}
do
    sudo npm install -g $glob
done
