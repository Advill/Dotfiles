#!/bin/bash

# Script to make symlinks to all dotfiles stored here
dir=$(pwd)
files="bashrc zshrc tmux.conf vimrc"
configfolders="nvim"
echo "current directory is ${dir}"
echo "moving current dotfiles to backup directory and installing new ones"

mkdir -p ./old
mkdir -p ./old/config

for file in $files; do
  if [[ -e ~/.$file ]]; then
    echo "Moving ${file}"
    mv ~/.$file $dir/old
  fi
  echo "Creating symlink to ${file} in home directory"
  ln -s $dir/$file ~/.$file
done

echo
mkdir -p ~/.config
echo "Installing ~/.config files"
for folder in $configfolders; do
  if [[ -e ~/.config/$folder ]]; then
    echo "Moving ${folder}"
    mv ~/.config/$folder $dir/old/config
  fi
  echo "Creating symlink to ${folder} in config"
  ln -s $dir/config/$folder ~/.config/$folder
done
