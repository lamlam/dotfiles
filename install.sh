#!/bin/bash

DOTDIR=$(pwd)

for dotfile in .*; do
    [[ $dotfile == ".git" ]] && continue
    [[ $dotfile == ".gitignore" ]] && continue
    [[ $dotfile == ".DS_Store" ]] && continue

    dist="$HOME/$dotfile"
    if [[ ! -e $dist ]]; then
        ln -s $DOTDIR/$dotfile $dist
    fi
done
