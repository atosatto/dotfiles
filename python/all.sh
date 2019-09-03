#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup Python"

PACKAGES=(
  ansible
  molecule
  neovim
)

for package in "${PACKAGES[@]}"
do
  info "Installing $package"
  PIP_REQUIRE_VIRTUALENV=false pip install $package
done
