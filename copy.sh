#!/bin/bash 

cp ~/.vimrc ./.vimrc 

git add ./.vimrc 
git commit -m "vimrc: update"
git push origin master 

