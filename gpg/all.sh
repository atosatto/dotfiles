#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup gpg-tools"

basepath="$(dirname $0)"
cd "$basepath" || exit

info "Installing the gpg-agent configuration file  "
install_dotfiles "$(pwd $basepath)/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
