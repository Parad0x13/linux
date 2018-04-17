#!/bin/bash

echo Parad0x13 Linux init v1.2

cp -i ./.bashrc ~/
cp -i ./.gitconfig ~/
cp -i ./.inputrc ~/
cp -i ./.vimrc ~/
cp -i ./.tmux.conf ~/
cp -i ./.gdbinit ~/

read -p "Install color profile with gogh, favorite is 84, Monokai-dark (y/n)? " choice
case "$choice" in
	y|Y ) wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh;;
esac

read -p "Set git to have a credential timeout of 7200 seconds (y/n)? " choice
case "$choice" in
	y|Y ) git config --global credential.helper 'cache --timeout 7200'
esac

echo
echo Install finished, be sure to check your new aliases!
