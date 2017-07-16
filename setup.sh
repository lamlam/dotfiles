#!/bin/bash

DOTDIR="~/dotfiles"

ln -s ${DOTDIR}/zshrc ~/.zshrc

if [ ! -e ~/.config ];then
    mkdir ~/.config
fi

ln -s ${DOTDIR}/nvim ~/.config/nvim
ln -s ${DOTDIR}/nvim ~/.vim
ln -s ${DOTDIR}/nvim/init.vim ~/.vimrc
