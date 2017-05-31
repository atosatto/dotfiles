#!/bin/bash
#
# Homebrew
#
# Installs packages and applications using Homebrew

set -e

# Check for Homebrew
if test ! "$(which brew)"
then
  echo "  Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd "$(dirname "$0")"

# homebrew packages

TAPS=(
    homebrew/binary
    homebrew/science
    caskroom/cask
    caskroom/versions
    neovim/neovim
)

FORMULAS=(
    youtube-dl
    ffmpeg
    git
    git-flow
    wget
    nmap
    watch
    tree
    tmux
    python
    python3
    node
    ruby
    go
    awscli
    shellcheck
    neovim
    packer
    terraform
    keybase
    mosh
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
    gpgtools
    iterm2
    skype
    spotify
    vlc
    webtorrent
    the-unarchiver
    vagrant
    virtualbox
    wireshark
    xquartz
    chicken
    java
    atom
    docker
    mactex
    xampp
    keeweb
    dash2
    joinme
    etcher
    mkchromecast
)

for tap in "${TAPS[@]}"
do
    brew tap $tap
done

brew install "${FORMULAS[@]}"

brew update

brew cask install --appdir=/Applications "${CASKS[@]}"

# brew install graphviz --with-gts

brew cleanup

exit 0
