#!/bin/bash 
cd $1 
cp ~/.vimrc ./.vimrc 
cp ~/.zshrc ./.zshrc

git add ./.vimrc 
git commit -m "vimrc: update"

git add ./.zshrc
git commit -m "zshrc: update"
git push origin master 

