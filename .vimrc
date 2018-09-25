set number
set expandtab
set tabstop=2
set shiftwidth=2
set title
set smartindent
syntax on
set backspace=2
set hidden

set nocompatible
filetype off

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/aoshi/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/aoshi/.vim/dein')
  call dein#begin('/Users/aoshi/.vim/dein')

  " Plugins here...
  call dein#add('scrooloose/nerdtree')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

" KeyBinds
nnoremap <silent> <C-b><C-p> :bprev<CR>
nnoremap <silent> <C-b><C-n> :bnext<CR>
nnoremap <silent> <C-b><C-l> :ls<CR>
nnoremap <silent> <C-k><C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-m><C-l> :wincmd l<CR>
nnoremap <silent> <C-m><C-h> :wincmd h<CR>
nnoremap <silent> <C-m><C-j> :wincmd j<CR>
nnoremap <silent> <C-m><C-k> :wincmd k<CR>
