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

# NB:
# - The docker cask provides the kubectl command
# - The python package is installed as dependency of the sshuttle command, however pyenv is used to manage the installed python versions

TAPS=(
    homebrew/cask-versions
    homebrew/cask-drivers
    neovim/neovim
)

FORMULAS=(
    git
    wget
    nmap
    watch
    tree
    gnu-tar
    gnu-sed
    coreutils
    tmux
    fzf
    starship
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
    kubectl
    kustomize
    k9s
    kind
    kubectx
    minikube
    pinentry-mac
    yubikey-personalization
    ffmpeg
)

CASKS=(
    spectacle
    dropbox
    firefox
    keepingyouawake
    appcleaner
    cyberduck
    gpg-suite
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
    garmin-express
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
  brew install --cask --appdir=/Applications $cask
done

info "Removing outdated brew files"
brew cleanup
