#!/bin/sh

cd "$(dirname "$0")"

echo "  Installing GIT Configuration"

if [ ! -d '/etc/git/' ]; then
	sudo mkdir '/etc/git/'
fi

if [ ! -e "`pwd $(dirname $0)`/global_gitignore" ]; then
	sudo ln -s "`pwd $(dirname $0)`/global_gitignore" /etc/git/global_gitignore
fi