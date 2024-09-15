#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup Homebrew"

# Check for Homebrew

if test ! "$(which brew)"; then
  info "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

cd "$(dirname "$0")"

info "Updating Homebrew"
brew update

info "Installing Brewfule"
brew bundle install

info "Removing outdated brew files"
brew cleanup
