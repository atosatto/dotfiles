#!/bin/bash

source scripts/functions.sh

PACKAGES=(
  ansible
  molecule
  virtualenv
  python-openstackclient
  python-vagrant
  docker-py
  dopy
  neovim
)

pip install "${PACKAGES[@]}"
