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
nnoremap ; :
nnoremap : ;

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
