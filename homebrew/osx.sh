#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup Homebrew"

# Check for Homebrew

if test ! "$(which brew)"; then
  info "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd "$(dirname "$0")"

info "Updating Homebrew"
brew update

info "Installing Brewfule"
brew bundle install

info "Removing outdated brew files"
brew cleanup
