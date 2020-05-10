#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup nvim"

basepath="$(dirname $0)"
cd "$basepath" || exit

mkdir -p ~/.config/nvim
for f in $(ls -d *.{vim,json})
do
  info "Symlinking $f into ~/.config/nvim"
  install_dotfiles "$(pwd $basepath)/$f" "$HOME/.config/nvim/$f"
done

exit 0
