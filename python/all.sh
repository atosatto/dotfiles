#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup Python"

VERSION_GLOBAL="3.7.4"

VERSIONS=(
  "3.6.9"
  "$VERSION_GLOBAL"
)

PACKAGES=(
  ansible
  molecule
  neovim
)

for version in "${VERSIONS[@]}"
do
  info "Installing Python $version"
  pyenv install -s $version
done

info "Setting Python $VERSION_GLOBAL as default Python version"
pyenv global $VERSION_GLOBAL

for package in "${PACKAGES[@]}"
do
  info "Installing $package"
  PIP_REQUIRE_VIRTUALENV=false pip install $package
done
