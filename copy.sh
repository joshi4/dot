#!/bin/bash
cp ~/.vimrc ./.vimrc
cp ~/.zshrc ./.zshrc
cp ~/.gitconfig ./.gitconfig
cp ~/.tmux.conf ./.tmux.conf

git add ./.vimrc
git commit -m "vimrc: update"

git add ./.zshrc
git commit -m "zshrc: update"

git add ./.gitconfig
git commit -m "gitconfig: update"

git add ./.tmux.conf
git commit -m "tmux: update"

git push -f origin master

