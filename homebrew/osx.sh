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
    youtube-dl
    ffmpeg
    git
    wget
    nmap
    watch
    tree
    gnu-tar
    md5sha1sum
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
    kubectl
    kustomize
    kubie
    pinentry-mac
    yubikey-personalization
)

CASKS=(
    spectacle
    dropbox
    firefox
    keepingyouawake
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
    minikube
    mactex
    keeweb
    dash2
    balenaetcher
    zoomus
    rocket-chat
    microsoft-office
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
  brew cask install --appdir=/Applications $cask
done

info "Removing outdated brew files"
brew cleanup
