#!/bin/bash
#
# nvim 
#
# Installs nvim configurations and dependencies

set -e

# Check for vim-plug
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]
then
    echo "    Installing vim-plug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

basepath="$(dirname $0)"
cd "$basepath" || exit

# Deploy the init.vim script
if [ ! -L ~/.config/nvim/init.vim ] 
then
    echo "    Installing the vim.init file"
    mkdir -p ~/.config/nvim
    ln -s "$(pwd $basepath)/init.vim" ~/.config/nvim/init.vim
fi

exit 0
