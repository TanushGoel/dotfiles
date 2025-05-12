#!/bin/bash

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.hushlogin ~/.hushlogin
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
mkdir -p ~/.config
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
for dir in nvim kitty tmux sketchybar fastfetch icons raycast vscode aerospace github-copilot; do
  ln -sf ~/dotfiles/.config/$dir ~/.config/$dir
done
# find ~ -type l ! -exec test -e {} \; -exec rm {} \;

# installation list:
# brew install git
# brew install tmux
# brew install wget
# brew install ripgrep
# brew install fastfetch
# brew install starship
# brew install tree-sitter
#
# brew install node
# brew install uv
# brew install python@3.13
# brew install lua
# brew install luajit
# brew install gcc
#
# brew install bash
# brew install zsh
# brew install neovim
# brew install kitty
#
# brew install openssh
# brew install gnupg
#
# brew install typst
#
# brew install --cask sketchybar
# brew install --cask font-monaspace
# brew install --cask aerospace
# brew install --cask raycast
