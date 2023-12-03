#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup Go"

export GOPATH="/usr/local/go"
export GOBIN="$GOPATH/bin"

if [ -n "$GOPATH" ] && [ ! -d "$GOPATH" ]; then
  info "Creating the $GOPATH directory"
  sudo mkdir -p "$GOPATH"
  sudo chown $USER:admin $path
fi

if [ -n "$GOBIN" ] && [ ! -d "$GOBIN" ]; then
  info "Creating the $GOBIN directory"
  sudo mkdir -p "$GOBIN"
  sudo chown $USER:admin $GOBIN
fi

PACKAGES=(
  github.com/rakyll/hey@latest
  github.com/google/go-containerregistry/cmd/crane@latest
)

for package in "${PACKAGES[@]}"
do
  info "Installing $package"
  go install $package
done
