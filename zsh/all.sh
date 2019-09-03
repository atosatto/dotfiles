#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup zsh"

basepath="$(dirname $0)"
cd "$basepath" || exit

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  info "Installing Oh My ZShell!"
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ "$SHELL" != "/bin/zsh" ]; then
  info "Setting zsh as default shell"
  chsh -s /bin/zsh
fi

info "Symlinking the ~/.zshrc and ~/.zprofile files"
install_dotfiles "$(pwd $basepath)/zshrc" "$HOME/.zshrc"
install_dotfiles "$(pwd $basepath)/zprofile" "$HOME/.zprofile"
