#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup Vagrant"

basepath="$(dirname $0)"
cd "$basepath" || exit

PLUGINS=(
  vagrant-hostmanager
  vagrant-vbguest
  vagrant-digitalocean
  vagrant-scp
)

if [ ! -d ~/.vagrant.d/ ]; then
    info "Creating the ~/.vagrant.d folder"
    mkdir -p ~/.vagrant.d/
fi

info "Symlinking the Vagrantfile defaults into ~/.vagrant.d"
install_dotfiles "$(pwd $basepath)/Vagrantfile" "$HOME/.vagrant.d/Vagrantfile"

for plugin in "${PLUGINS[@]}"
do
  info "Installing $plugin"
  vagrant plugin install $plugin
done
