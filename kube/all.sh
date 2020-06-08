#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup Kubernetes"

basepath="$(dirname $0)"
cd "$basepath" || exit

mkdir -p ~/.kube
for f in $(ls -d *.yaml)
do
  info "Symlinking $f into ~/.kube"
  install_dotfiles "$(pwd $basepath)/$f" "$HOME/.kube/$f"
done

exit 0
