#!/bin/bash

source ../script/functions.sh

set -e
cd "$(dirname "$0")"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
echo "   Installing Oh My ZShell!"
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi

echo "   Changing Default Shell to ZSH"
chsh -s /bin/zsh

echo "   Simlinking the zshrc and zprofile file"
install_dotfiles "`pwd $(dirname $0)`/zshrc.symlink"
install_dotfiles "`pwd $(dirname $0)`/zprofile.symlink"
