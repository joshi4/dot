#!/bin/bash 
cd $1 
cp ~/.vimrc ./.vimrc 
cp ~/.zshrc ./.zshrc
cp ~/.gitconfig ./.gitconfig

git add ./.vimrc 
git commit -m "vimrc: update"

git add ./.zshrc
git commit -m "zshrc: update"

git add ./.gitconfig
git commit -m "gitconfig: update"
git push origin master 

