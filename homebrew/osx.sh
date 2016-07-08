#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homeb\rew.

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
)

FORMULAS=(
    youtube-dl
    ffmpeg
    git
    git-flow
    wget
    nmap
    watch
    python
    python3
    node
    ruby
    go
    awscli
    shellcheck
    ansible
    docker
    docker-machine
    docker-compose
)

CASKS=(
    spectacle
    dropbox
    google-chrome
    google-hangouts
    appcleaner
    cyberduck
    lastpass
    gpgtools
    iterm2
    osxfuse
    skype
    slack
    limechat
    spotify
    vlc
    the-unarchiver
    vagrant
    virtualbox
    wireshark
    xquartz
    java
    atom
    mactex
)

for tap in "${TAPS[@]}"
do
    brew tap $tap
done

brew install "${FORMULAS[@]}"

brew update

brew cask install --appdir=/Applications "${CASKS[@]}"

# brew install graphviz --with-gts
# brew cask alfred link

brew cleanup

exit 0
