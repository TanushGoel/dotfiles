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

# package managers: homebrew, micromamba/pip, node

# find ~ -type l ! -exec test -e {} \; -exec rm {} \;
