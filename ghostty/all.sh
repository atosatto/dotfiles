#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup ghostty"

basepath="$(dirname $0)"
cd "$basepath" || exit

info "Installing the fish configuration"
mkdir -p "$HOME/.config/ghostty"
install_dotfiles "$(pwd $basepath)/config" "$HOME/.config/ghostty/config"
