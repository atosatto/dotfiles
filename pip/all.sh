#!/bin/bash

source scripts/functions.sh

PACKAGES=(
  ansible
  molecule
)

pip install "${PACKAGES[@]}"
