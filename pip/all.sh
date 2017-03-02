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
  boto
  neovim
)

pip install "${PACKAGES[@]}"
