#!/bin/bash
set -eu

## env
DOTDIR=$(cd $(dirname $0); pwd)
BASEDIR=${HOME}
FLAG_F=0
FLAG_DEL=0

## handle args
usage_exit() {
    echo "Usage: $0 [-f] [-d basedir] [-D uninstall]" 1>&2
    exit 1
}

while getopts fd:hD OPT
do
    case $OPT in
        f)  FLAG_F=1
            ;;
        d)  BASEDIR=$OPTARG
            ;;
        D)  FLAG_DEL=1
            ;;
        h)  usage_exit
            ;;
        \?) usage_exit
            ;;
    esac
done
shift $((OPTIND - 1))

## move dotfiles
SRC=("zshrc" "nvim" "nvim" "nvim/init.vim" "gitconfig")
TARGET=(".zshrc" ".config/nvim" ".vim" ".vimrc" ".gitconfig")

# remove old files
if [ ${FLAG_F} -eq 1 ] || [ ${FLAG_DEL} -eq 1 ];then
    for v in ${TARGET[@]}; do
        t="${BASEDIR}/$v"
        if [ -e $t ];then
            echo "rm -rf $t"
            rm -rf $t
        fi
    done
fi

if [ ${FLAG_DEL} -eq 1 ];then
    exit 0
fi

if [ ! -e ~/.config ];then
    mkdir ~/.config
fi

# place dotfiles
for i in $(seq 0 $(expr ${#SRC[@]} - 1)); do
    s="${DOTDIR}/${SRC[$i]}"
    t="${BASEDIR}/${TARGET[$i]}"
    if [ ! -e $t ];then
        echo "ln -s $s $t"
        ln -s $s $t
    fi
done

