
" https://vim-jp.org/vimdoc-ja/options.html#'compatible'
set nocompatible

" https://vim-jp.org/vimdoc-ja/usr_30.html#30.5
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

" https://vim-jp.org/vimdoc-ja/usr_30.html#30.4
set smartindent
set cindent

" https://vim-jp.org/vimdoc-ja/syntax.html
syntax on

" https://vim-jp.org/vimdoc-ja/recover.html#:noswapfile
set noswapfile

set number

filetype plugin on

set encoding=UTF-8

nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
set hidden

inoremap <silent> jj <ESC>

set incsearch
