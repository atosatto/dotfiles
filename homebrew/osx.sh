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

# Homebrew packages

TAPS=(
    homebrew/cask-versions
    neovim/neovim
)

FORMULAS=(
    youtube-dl
    ffmpeg
    git
    wget
    nmap
    watch
    tree
    tmux
    fzf
    pyenv
    pyenv-virtualenv
    go
    shellcheck
    neovim
    packer
    terraform
    mosh
    sshuttle
    jq
    bind
    icdiff
    pwgen
)

CASKS=(
    spectacle
    dropbox
    firefox
    caffeine
    appcleaner
    cyberduck
    gpg-suite
    tunnelblick
    iterm2
    spotify
    vlc
    webtorrent
    the-unarchiver
    vagrant
    virtualbox
    virtualbox-extension-pack
    wireshark
    xquartz
    docker
    mactex
    keeweb
    dash2
    balenaetcher
    zoomus
    rocket-chat
)

for tap in "${TAPS[@]}"
do
  info "Tapping $tap"
  brew tap $tap
done

info "Updating Homebrew"
brew update

for formula in "${FORMULAS[@]}"
do
  info "Installing $formula"
  brew install $formula
done

for cask in "${CASKS[@]}"
do
  info "Installing $cask"
  brew cask install --appdir=/Applications $cask
done

info "Removing outdated brew files"
brew cleanup
