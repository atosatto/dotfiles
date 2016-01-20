#!/bin/bash

source scripts/functions.sh

PACKAGES=(
  language-docker
  language-ansible
  linter
  linter-shellcheck
  go-plus
)


apm install "${PACKAGES[@]}"
