#!/bin/bash

source scripts/functions.sh

PACKAGES=(
  ansible
  molecule
  python-openstackclient
)

pip install "${PACKAGES[@]}"
