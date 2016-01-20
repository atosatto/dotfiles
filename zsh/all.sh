#!/bin/bash

source "scripts/functions.sh"

basepath="$(dirname $0)"
cd "$basepath" || exit

if [ ! -d "$HOME/.oh-my-zsh" ]; then
echo "   Installing Oh My ZShell!"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "   Changing Default Shell to ZSH"
chsh -s /bin/zsh

echo "   Simlinking the zshrc and zprofile file"
install_dotfiles "$(pwd $basepath)/zshrc.symlink"
install_dotfiles "$(pwd $basepath)/zprofile.symlink"
