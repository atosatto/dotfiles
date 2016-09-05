#!/bin/bash

source scripts/functions.sh

basepath="$(dirname $0)"
cd "$basepath" || exit

PLUGINS=(
  vagrant-hostmanager
  vagrant-vbguest
)

if [ ! -e ~/.vagrant.d/Vagrantfile ]; then
    echo "  Installing the Vagrantfile defaults file into ~/.vagrant.d"
    link_files "$(pwd $basepath)/Vagrantfile" ~/.vagrant.d/Vagrantfile
fi

vagrant plugin install "${PLUGINS[@]}"
