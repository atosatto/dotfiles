#!/bin/sh

source ../script/functions.sh

cd "$(dirname "$0")"

echo "  Installing GIT Configuration"

if [ ! -d '/etc/git/' ]; then
	sudo mkdir '/etc/git/'
fi

install_dotfiles "`pwd $(dirname $0)`gitconfig.symlink"

if [ ! -e "`pwd $(dirname $0)`/global_gitignore" ]; then
	sudo ln -s "`pwd $(dirname $0)`/global_gitignore" /etc/git/global_gitignore
fi
