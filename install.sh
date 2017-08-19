#!/bin/bash

echo Parad0x13 Linux init v1.1

cp -i ./.bashrc ~/
cp -i ./.gitconfig ~/
cp -i ./.inputrc ~/
cp -i ./.vimrc ~/
cp -i ./.tmux.conf ~/
cp -i ./.gdbinit ~/

echo Attempting to install ssh certs
mkdir ~/.ssh
cp -i ./id_rsa_git ~/.ssh/
cp -i ./id_rsa_git.pub ~/.ssh/
ssh-add ~/.ssh/id_rsa_git

echo Install finished, be sure to check your new aliases!

