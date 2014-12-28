#!/bin/sh

cd "$(dirname "$0")"

echo "  Installing GIT Configuration"

ln -s "`pwd $(dirname $0)`/global_gitignore" /etc/git/global_gitignore