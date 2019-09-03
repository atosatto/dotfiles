#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup git"

basepath="$(dirname $0)"
cd "$basepath" || exit

if [ ! -d "/etc/git/" ]; then
    info "Creating the /etc/git/ directory"
    sudo mkdir -p "/etc/git/"
fi

info "Installing the global_gitignore file into /etc/git"
install_dotfiles "$(pwd $basepath)/global_gitignore" /etc/git/global_gitignore yes

info "Symlinking the ~/.gitconfig file"
install_dotfiles "$(pwd $basepath)/gitconfig" "$HOME/.gitconfig"
