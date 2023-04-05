set encoding=utf-8
set number
set expandtab
set tabstop=2
set shiftwidth=2
set title
set smartindent
set backspace=2
set hidden
set clipboard+=unnamed
set cursorline
set showtabline=2
set filetype=on
set helplang="ja,en"
set writebackup!
set ignorecase!

let mapleader = ","

" --- vim-plug ---
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" bufferline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airlinentheme='wombat'

" 'gc' to comment/uncomment
Plug 'tpope/vim-commentary'

Plug 'airblade/vim-gitgutter'

" theme
Plug 'ellisonleao/gruvbox.nvim'

" fuzzy-finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" filetree
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()
" --- vim-plug ---

set background=dark
colorscheme gruvbox

" vim-gitgutter
set updatetime=500

" --- coc-nvim ---
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" --- coc-nvim ---

" --- telescope ---
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" --- telescope ---

" --- nvim-tree ---
luado require("nvim-tree").setup()
