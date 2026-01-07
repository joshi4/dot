#!/bin/bash

# Check if necessary directories exist
if [ ! -d ~/.config/shell ]; then
    echo "Error: ~/.config/shell directory does not exist"
    exit 1
fi

if [ ! -d ~/.config/nvim ]; then
    echo "Error: ~/.config/nvim directory does not exist"
    exit 1
fi

if [ ! -d ~/.oh-my-zsh/custom ]; then
    echo "Error: ~/.oh-my-zsh/custom directory does not exist"
    exit 1
fi

if [ ! -d ~/.config/ghostty ]; then
    echo "Error: ~/.config/ghostty directory does not exist"
    exit 1
fi

# Copy configuration files to their home directory locations
cp ./.vimrc ~/.vimrc
cp ./.zshrc ~/.zshrc
cp ./.gitconfig ~/.gitconfig
cp ./.tmux.conf ~/.tmux.conf
cp ./common.sh ~/.config/shell/common.sh
cp -R ./nvim ~/.config/nvim

cp ./.oh-my-zsh/custom/aliases.sh ~/.oh-my-zsh/custom/aliases.sh
cp ./.oh-my-zsh/custom/customization.sh ~/.oh-my-zsh/custom/customization.sh

cp ./.config/ghostty/config ~/.config/ghostty/config

cp ./.config/starship.toml ~/.config/starship.toml

echo "Configuration files have been copied to their respective locations."
