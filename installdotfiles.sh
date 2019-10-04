#!/bin/bash

# Script to make symlinks to all dotfiles stored here
dir=$(pwd)
files="bashrc zshrc tmux.conf vimrc"
configfolders="nvim rofi sway termite waybar"
echo "current directory is ${dir}"
echo "moving current dotfiles to backup directory"

mkdir ./old
mkdir ./old/config

for file in $files; do
	echo "Moving $file"
	mv ~/.$file $dir/old
	echo "Creating symlink to $file in home directory"
	ln -s $dir/$file ~/.$file
done

echo
echo "Installing ~/.config files"
for folder in $configfolders; do
  echo "Moving $folder"
  mv ~/.config/$folder $dir/old/config
  echo "Creating symlink to $folder in config"
  ln -s $dir/config/$folder ~/.config/$folder
done
