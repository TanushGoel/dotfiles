#!/usr/bin/env bash

# symlinks
ln -sf ~/dotfiles/shell/.zprofile ~/.zprofile
ln -sf ~/dotfiles/shell/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
mkdir -p ~/.config
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
for dir in nvim kitty tmux fastfetch; do
    if [ -d ~/dotfiles/$dir ]; then
        ln -sf ~/dotfiles/$dir ~/.config/$dir
    fi
done

find ~/dotfiles -type f -name "*.sh" -exec chmod +x {} \; # make scripts executable

# installations (Linuxbrew)
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
install_if_missing() { command -v "$1" >/dev/null 2>&1 || brew install "$1"; }
for pkg in git curl ripgrep fastfetch starship lua node uv pixi bash zsh kitty tmux neovim openssh gnupg lynx typst pymol; do
    install_if_missing "$pkg"
done

# zsh default
if [[ "$SHELL" != */zsh ]]; then
    chsh -s $(which zsh)
fi
