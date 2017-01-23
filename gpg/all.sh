#!/bin/bash

source "scripts/functions.sh"

basepath="$(dirname $0)"
cd "$basepath" || exit

if [ ! -e "$HOME/.gnupg/gpg-agent.conf" ]; then
    echo "  Installing the gpg-agent configuration file  "
    ln -s "$(pwd $basepath)/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
fi
