
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
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/vim-goimports'
call plug#end()
"""""" end vim-plug

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript'],
        \ })
endif

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

set number

" https://github.com/prabirshrestha/vim-lsp
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gh <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

filetype plugin on
" https://vim-jp.org/vimdoc-ja/pi_netrw.html
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_sizestyle="H"
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_preview=1
let g:netrw_altv=1
let g:netrw_winsize=70

let g:asyncomplete_popup_delay=200
let g:lsp_text_edit_enabled=0

nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
set hidden

inoremap <silent> jj <ESC>

