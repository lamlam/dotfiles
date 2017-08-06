"change display mapping
" Tab jump
" terminal mode
nmap <Down> <C-w>j
nmap <Up> <C-w>k
nmap <Left> <C-w>h
nmap <Right> <C-w>l
" terminal mode
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
endif

" move
noremap <S-h>   ^
noremap <S-l>   $
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" mode change command
imap <C-h> <esc>
vmap <C-h> <esc>
nnoremap ; :
nnoremap : ;

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" Unite
if has('nvim')
    nmap <silent> <C-u><C-p> ;<C-u>Denite file_rec<CR>
    nmap <silent> <C-u><C-j> ;<C-u>Denite line<CR>
    nmap <silent> <C-u><C-g> ;<C-u>Denite grep<CR>
    nmap <silent> <C-u><C-u> ;<C-u>Denite file_mru<CR>
    nmap <silent> <C-u><C-y> ;<C-u>Denite neoyank<CR>
    nmap <silent> <C-u>; ;<C-u>Denite -resume -immediately -select=+1<CR>
endif
