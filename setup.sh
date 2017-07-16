#!/bin/bash

DOTDIR=${HOME}/dotfiles

ln -s ${DOTDIR}/zshrc ${HOME}/.zshrc

if [ ! -e ~/.config ];then
    mkdir ~/.config
fi

ln -s ${DOTDIR}/nvim ${HOME}/.config/nvim
ln -s ${DOTDIR}/nvim ${HOME}/.vim
ln -s ${DOTDIR}/nvim/init.vim ${HOME}/.vimrc
