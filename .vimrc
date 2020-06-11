"dein Scripts-----------------------------
" Required:
set runtimepath+=/Users/arsley/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/arsley/.vim/dein')
  call dein#begin('/Users/arsley/.vim/dein')

  let deintoml = expand('~/dotfiles/dein.toml')
  call dein#load_toml(deintoml, {'lazy': 0})

  " Required:
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
 call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
"End dein Scripts-------------------------

set number
set expandtab
set tabstop=2
set shiftwidth=2
set title
set smartindent
set backspace=2
set hidden
set clipboard+=unnamed
set laststatus=2
set noshowmode
set wildmenu
set incsearch
set cursorline
set showtabline=2
filetype on
syntax on

" KeyBinds
nnoremap <silent> <C-b><C-p> :bprev<CR>
nnoremap <silent> <C-b><C-n> :bnext<CR>
nnoremap <silent> <C-b><C-l> :ls<CR>
nnoremap <silent> <C-k><C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-m><C-l> :wincmd l<CR>
nnoremap <silent> <C-m><C-h> :wincmd h<CR>
nnoremap <silent> <C-m><C-j> :wincmd j<CR>
nnoremap <silent> <C-m><C-k> :wincmd k<CR>

" NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" fzf
set rtp+=/usr/local/bin/fzf
let g:fzf_preview_window = 'right:60%'

" lightline
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline                  = {}
let g:lightline.colorscheme      = 'PaperColor_light'
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
