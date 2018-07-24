#!/bin/bash

# Script to make symlinks to all dotfiles stored here
dir=$(pwd)
files="bashrc zshrc tmux.conf vimrc"
echo "current directory is ${dir}"
echo "moving current dotfiles to backup directory"

mkdir ./old

for file in $files; do
	echo "Moving $file"
	mv ~/.$file $dir/old
	echo "Creating symlink to $file in home directory"
	ln -s $dir/$file ~/.$file
done

