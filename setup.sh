#!/bin/bash

ln -s zshrc ~/.zshrc

if [ ! -e ~/.config ];then
    mkdir ~/.config
fi

ln -s nvim ~/.config/nvim
ln -s nvim ~/.vim
ln -s ~/.config/nvim/init.vim ~/.vimrc
