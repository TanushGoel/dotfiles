#!/usr/bin/env bash

# sudo passwd $(whoami)
# sudo apt/apt-get/yum/dnf install git
# git clone https://github.com/TanushGoel/dotfiles.git
# !chmod +x setuplnx.sh
# ./setuplnx.sh

# symlinks
ln -sf ~/dotfiles/shell/.zprofile ~/.zprofile
ln -sf ~/dotfiles/shell/.zshrc ~/.zshrc
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
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" -- --prefix="$HOME/.linuxbrew"
    git -C "$HOME/.linuxbrew/Homebrew" remote set-url origin https://github.com/Homebrew/brew
    eval "$($HOME/.linuxbrew/bin/brew shellenv)"
fi
install_if_missing() { command -v "$1" >/dev/null 2>&1 || brew install "$1"; }
for pkg in git curl ripgrep fastfetch starship lua node uv pixi bash zsh kitty tmux neovim openssh gnupg lynx typst pymol; do
    install_if_missing "$pkg"
done

# zsh default
sudo usermod -s $(which zsh) $(whoami)
