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

"Fzf - fuzzy searching
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

nnoremap <Space>f :Files<CR>
nnoremap <Space>h :History<CR>
"Search History
nnoremap <Space><C-h> :History/<CR> 
"Search History
nnoremap <Space><C-c> :History:<CR>
nnoremap <Space>b :Buffers<CR>
nnoremap <Space>c :Colors<CR>
nnoremap <Space>m :Marks<CR>
nnoremap <Space>w :Windows<CR>
nnoremap <Space>s :Snippets<CR>

