#!/bin/bash

set -e

NPM_GLOBALS=(
    cordova
    ios-sim
    ionic
)

for glob in ${NPM_GLOBALS[@]}
do
    sudo npm install -g $glob
done
