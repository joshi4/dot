#!/bin/bash 
cd $1 
cp ~/.vimrc ./.vimrc 

git add ./.vimrc 
git commit -m "vimrc: update"
git push origin master 

