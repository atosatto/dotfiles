#!/bin/bash

source "scripts/functions.sh"

basepath="$(dirname $0)"
cd "$basepath" || exit

echo "  Installing GIT Configuration"

if [ ! -d '/etc/git/' ]; then
    echo "  Creating the /etc/git/ directory"
    sudo mkdir '/etc/git/'
fi

if [ ! -e /etc/git/global_gitignore ]; then
    echo "  Installing the global_gitignore file into /etc/git"
    sudo ln -s "$(pwd $basepath)/global_gitignore" /etc/git/global_gitignore
fi

install_dotfiles "$(pwd $basepath)/gitconfig.symlink"
