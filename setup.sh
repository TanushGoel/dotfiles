#!/usr/bin/env bash

# symlinks
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

./.config/icons/change.sh  # change app icons

curl -o ~/.cacert.pem https://curl.se/ca/cacert.pem  # mozilla's CA cert bundle

# installations
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install git ripgrep
brew install fastfetch starship
brew install lua node uv pixi
brew install bash zsh kitty tmux neovim
brew install openssh gnupg
brew install typst pymol
brew install --cask font-monaspace raycast nikitabobko/tap/aerospace
brew tap FelixKratz/formulae
brew install sketchybar
brew services start sketchybar
