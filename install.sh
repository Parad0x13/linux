#!/bin/bash

echo Parad0x13 Linux init v1.3

cp -i ./.bash_aliases ~/
cp -i ./.gitconfig ~/
cp -i ./.inputrc ~/
cp -i ./.vimrc ~/
cp -i ./.tmux.conf ~/
cp -i ./.gdbinit ~/

# Default to skip install so I can spam 'Y' and not have it auto install gogh
read -p "Skip install of color profile with gogh, favorite is 84, Monokai-dark (y/n)? " choice
case "$choice" in
	n|N ) wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh;;
esac

read -p "Set git to have a credential timeout of 7200 seconds (y/n)? " choice
case "$choice" in
	y|Y ) git config --global credential.helper 'cache --timeout 7200'
esac

echo
echo Install finished, be sure to check your new aliases!
