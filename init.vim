let g:mapleader = "\<Space>"

"Vim Plug Plugins
"""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

"Vim Airline Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"A pretty magical thing
Plug 'Shougo/denite.nvim'

"A better molokai theme
Plug 'joedicastro/vim-molokai256'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Snippets for fzf
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

call plug#end()

"General Settings
""""""""""""""""""""
set visualbell "Use a visual bell instead of bleeping
set autoindent

"Search Settings
""""""""""""""""""""""
set ignorecase "Ignore case while searching
set smartcase  "Keep case when searching with *
set hlsearch   "Highlight search results

" Set various stylings
"""""""""""""""""""""

" Set relative number
set relativenumber

"Highlight cursor
set cursorline

"Highlight syntax
syntax on
""""""""""""""""""""""

"Airline Settings
"
set noshowmode

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
let g:airline#extensions#branches#enabled=1
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#hunks#non_zero_only=1

"Theme
colorscheme molokai256 

"Denite Settings
"""""""""""""""""""""""""""""

"Custom Menu
let s:menus = {}

let s:menus.zsh = {
	\ 'description': 'Edit your zsh configuration'
	\ }

let s:menus.zsh.file_candidates = [
	\ ['ZSH Configuration', '~/.zshrc'],
	\ ]


call denite#custom#var('menu', 'menus', s:menus)

"Fzf Settings
"""""""""""""""""""""""""""""""""

nnoremap <leader>f :Files<CR>
nnoremap <leader>h :History<CR>
"Search History
nnoremap <leader><C-h> :History/<CR> 
"Search History
nnoremap <leader><C-c> :History\:<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Colors<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>w :Windows<CR>
nnoremap <leader>s :Snippets<CR>

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
