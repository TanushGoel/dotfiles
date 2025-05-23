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

./.config/icons/change.sh

# installation list:
# brew install git
# brew install wget
# brew install ripgrep

# brew install fastfetch
# brew install starship

# brew install lua
# brew install node
# brew install uv
# brew install pixi

# brew install bash
# brew install zsh
# brew install kitty
# brew install tmux
# brew install neovim

# brew install openssh
# brew install gnupg

# brew install typst
# brew install pymol

# brew tap FelixKratz/formulae
# brew install sketchybar
# brew services start sketchybar

# brew install --cask font-monaspace
# brew install --cask raycast
# brew install --cask nikitabobko/tap/aerospace
