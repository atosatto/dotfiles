#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

set -e

# Check for Homebrew
if test ! $(which brew)
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
    python
    python3
    ruby
    go
)

CASKS=(
    caffeine
    spectacle
    dash
    dropbox
    google-chrome
    google-hangouts
    toggldesktop
    mou
    appcleaner
    cyberduck
    simple-comic
    arduino
    gpgtools
    iterm2
    osxfuse
    skype
    spotify
    sublime-text
    the-unarchiver
    vagrant
    virtualbox
    vlc
    wireshark
    xquartz
    java
    android-studio
    phpstorm
    pycharm
    textwrangler
    emacs
    mactex
    tunnelblick
)

for tap in ${TAPS[@]}
do
    brew tap $tap
done

brew install ${FORMULAS[@]}

brew update

brew cask install --appdir=/Applications ${CASKS[@]}

#brew cask alfred link

brew cleanup

exit 0
