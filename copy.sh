#!/bin/bash
cp ~/.vimrc ./.vimrc
cp ~/.zshrc ./.zshrc
cp ~/.gitconfig ./.gitconfig
cp ~/.tmux.conf ./.tmux.conf
cp ~/.config/shell/common.sh ./common.sh

cp ~/.oh-my-zsh/custom/aliases.sh ./.oh-my-zsh/custom/aliases.sh
cp ~/.oh-my-zsh/custom/customization.sh ./.oh-my-zsh/custom/customization.sh

cp ~/.config/ghostty/config.json ./.config/ghostty/config.json

git add ./.vimrc
git commit -m "vimrc: update"

git add ./.zshrc
git add ./common.sh
git commit -m "zshrc: update"

git add ./.gitconfig
git commit -m "gitconfig: update"

git add ./.tmux.conf
git commit -m "tmux: update"

git add ./.oh-my-zsh/custom
git commit -m "oh-my-zsh: update"

git add ./.config/ghostty/config.json
git commit -m "ghostty: update"

git push -f origin master

