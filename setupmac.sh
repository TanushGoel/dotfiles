#!/usr/bin/env bash

# symlinks
ln -sf ~/dotfiles/shell/.zprofile ~/.zprofile
ln -sf ~/dotfiles/shell/.zshrc ~/.zshrc
ln -sf ~/dotfiles/shell/.hushlogin ~/.hushlogin
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
mkdir -p ~/.config
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
for dir in nvim kitty tmux sketchybar fastfetch icons raycast aerospace github-copilot; do
    ln -sf ~/dotfiles/$dir ~/.config/$dir
done
# find ~ -type l ! -exec test -e {} \; -exec rm {} \;

# cursor settings
cp ~/dotfiles/code/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
cp ~/dotfiles/code/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json

find ~/dotfiles -type f -name "*.sh" -exec chmod +x {} \; # make scripts executable

~/dotfiles/icons/change.sh  # change app icons

curl -o ~/.cacert.pem https://curl.se/ca/cacert.pem  # mozilla's CA cert bundle

# installations
command -v brew &>/dev/null || { /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && eval "$(/opt/homebrew/bin/brew shellenv)"; }
install_if_missing() { command -v "$1" >/dev/null 2>&1 || brew install "$1"; }
install_cask_if_missing() { brew list --cask "$1" >/dev/null 2>&1 || brew install --cask "$1"; }

for pkg in git curl ripgrep fastfetch starship lua node uv pixi bash zsh kitty tmux neovim openssh gnupg lynx typst pymol; do
    install_if_missing "$pkg"
done

install_cask_if_missing font-monaspace
install_cask_if_missing raycast
install_cask_if_missing nikitabobko/tap/aerospace

brew list sketchybar >/dev/null 2>&1 || { brew tap FelixKratz/formulae && brew install sketchybar; }
brew services start sketchybar
