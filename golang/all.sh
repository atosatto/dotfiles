#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup Go"

if [ -n "$GOPATH" ]; then
  for path in ${GOPATH//:/ }
  do
    if [ ! -d "$path" ]; then
      info "Creating the $path directory"
      sudo mkdir -p "$path"
      sudo chown $USER:admin $path
    fi
  done
fi

if [ -n "$GOBIN" ] && [ ! -d "$GOBIN" ]; then
  info "Creating the $GOBIN directory"
  sudo mkdir -p "$GOBIN"
  sudo chown $USER:admin $GOBIN
fi

PACKAGES=(
  github.com/rakyll/hey
)

for package in "${PACKAGES[@]}"
do
  info "Installing $package"
  go get -u $package
done
