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

" reload init.vim
nnoremap <silent> <Leader><Leader> :source $MYVIMRC<CR>

" --- vim-plug ---
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" theme
Plug 'ellisonleao/gruvbox.nvim'

" fuzzy-finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" filetree
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" utilities
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'windwp/nvim-autopairs'
Plug 'ntpeters/vim-better-whitespace'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()
" --- vim-plug ---

set background=dark
colorscheme gruvbox

" --- vim-gitgutter ---
set updatetime=500
let g:gitgutter_highlight_linenrs = 1

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
" --- vim-gitgutter ---

" --- coc-nvim ---
" configurations
let g:coc_node_path = '$HOME/.asdf/shims/node'

" extensions
let g:coc_global_extensions = [
    \'coc-tsserver',
    \'coc-json',
    \'@yaegassy/coc-volar-tools',
    \'coc-eslint',
    \'coc-prettier'
  \]

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
nmap <Leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <Leader>fo <Plug>(coc-format-selected)
nmap <Leader>fo <Plug>(coc-format-selected)
" --- coc-nvim ---

" --- telescope ---
nnoremap <Leader>ff <CMD>Telescope find_files<CR>
nnoremap <Leader>fg <CMD>Telescope live_grep<CR>
nnoremap <Leader>fb <CMD>Telescope buffers<CR>
nnoremap <Leader>fh <CMD>Telescope help_tags<CR>

" --- nvim-tree ---
luado require("nvim-tree").setup()
nnoremap <Leader>ft <CMD>NvimTreeToggle <CR>

" --- nvim-autopairs ---
luado require("nvim-autopairs").setup({})

" --- vim-better-whitespace ---
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" --- display hidden chars ---
" ref: https://askubuntu.com/a/74503
set listchars=eol:↓,tab:>-,trail:~,extends:>,precedes:<
set list

" --- vim-airline ---
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

let g:airline#extensions#default#layout = [
    \['a', 'b', 'c'],
    \['x', 'y', 'error', 'warning'],
  \]
" --- vim-airline ---

" switch buffers
nmap <C-h> <Plug>AirlineSelectPrevTab
nmap <C-l> <Plug>AirlineSelectNextTab
" --- vim-airline ---

" --- indent-blankline ---
" MEMO: is this the best way to exec multiline lua script?
lua << EOF
  require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = true,
  })
EOF
