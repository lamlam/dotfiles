
" https://vim-jp.org/vimdoc-ja/options.html#'compatible'
set nocompatible

"""""" start vim-plug
" install vim-plug if needed
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugin setting
call plug#begin('~/.vim/plugged')
Plug 'cocopon/iceberg.vim'
call plug#end()
"""""" end vim-plug

" https://vim-jp.org/vimdoc-ja/usr_30.html#30.5
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" https://vim-jp.org/vimdoc-ja/usr_30.html#30.4
set smartindent
set cindent

" https://vim-jp.org/vimdoc-ja/syntax.html
syntax on
colorscheme iceberg

" https://vim-jp.org/vimdoc-ja/recover.html#:noswapfile
set noswapfile
