#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup Fish and Starship"

basepath="$(dirname $0)"
cd "$basepath" || exit

if [ "$SHELL" != "/opt/homebrew/bin/fish" ]; then
  info "Setting fish as default shell"
  grep -q '/opt/homebrew/bin/fish' /etc/shells || echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
  chsh -s /opt/homebrew/bin/fish
fi

info "Installing the fish configuration"
mkdir -p "$HOME/.config/fish"
install_dotfiles "$(pwd $basepath)/config.fish" "$HOME/.config/fish/config.fish"


info "Installing the starship configuration"
mkdir -p "$HOME/.config/"
install_dotfiles "$(pwd $basepath)/starship.toml" "$HOME/.config/starship.toml"
