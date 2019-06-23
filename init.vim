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

" Material Theme for Vim
Plug 'kaicataldo/material.vim'

" Dracula Theme
Plug 'dracula/vim', { 'as': 'dracula' }

"Fuzzy searching
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Snippets for fzf
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

"Extends register functionality
Plug 'junegunn/vim-peekaboo'

"Markdown Preview
Plug 'junegunn/vim-xmark', { 'do': 'make' }

call plug#end()

"True Color Support
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
""""""""""""""""""""""""""""""""""""""""
" Highlight trailing whitespace and spaces touching tabs
:highlight TrailingWhitespace ctermbg=darkred guibg=darkred
:let w:m2=matchadd('TrailingWhitespace', '\s\+$\| \+\ze\t\|\t\+\ze')

"General Settings
""""""""""""""""""""
set visualbell    "Use a visual bell instead of bleeping
set tabstop=4 	  " A tab = 4 spaces
set shiftwidth=4  " Number of spaces for autoindent 
set softtabstop=4 " A soft tab of four spaces
set autoindent	  " Set on the auto indent

:set splitright "Split new windows to the right

" Make j and k move up and down better for wrapped lines
:noremap k gk
:noremap j gj
:noremap gk k
:noremap gj j

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
syntax enable

" Autoload configuration when this file changes 
autocmd! BufWritePost ~/.config/nvim/init.vim source %

"Setup Indent Lines
let g:indentLine_setColors = 0
""""""""""""""""""""""
"
"Airline Settings
"
set noshowmode

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
let g:airline#extensions#branches#enabled=1
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#hunks#non_zero_only=1

"Theme
"
set background=dark
colorscheme molokai256 
let g:material_theme_style='dark'

" Quick Commands
"""""""""""""""""""""""""""

" Quick save and quit
nnoremap <Leader>wq :wq!<CR>

" Quick save but don't quit
nnoremap <Leader>w :w<CR>

" Quick quit without saving
nnoremap <Leader>qa :qa!<CR>

"Quit window
nnoremap <Leader>q :q<CR>

" New line and then go to insert mode
nnoremap <Leader>nl $o<CR>

"Netrw File Explorer vertical split
nnoremap <leader>vx :Vexplore<CR>

"PlugInstall
nnoremap <leader>vp :PlugInstall<CR>

"PlugStatus
nnoremap <leader>vs :PlugStatus<CR>

"Single Quote Word
nnoremap rq ciw''<Esc>P<CR>

"Double Quote Word
nnoremap rdq ciw""<Esc>P<CR>

"Netrw Settings
"""""""""""""""""""""""""""""""""""

"Remove Banner
let g:netrw_banner = 0

"Set List Style
let g:netrw_liststyle = 1

"Set window style
let g:netrw_winsize = 35

"Neocomplete Settings
"""""""""""""""""""""

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"Denite Settings
""""""""""""""""""""""""""""""
"
""Custom Menu
"let s:menus = {}
"
"let s:menus.zsh = {
"	\ 'description': 'Edit your zsh configuration'
"	\ }
"
"let s:menus.zsh.file_candidates = [
"	\ ['ZSH Configuration', '~/.zshrc'],
"	\ ]
"
"
"call denite#custom#var('menu', 'menus', s:menus)

"Fzf Settings
"""""""""""""""""""""""""""""""""
" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

"call fzf#run({'source': 'find ~/ -path Library -prune -o 2> /dev/null', 'sink': 'e'})

nnoremap <leader>f :FZF<CR>
"Search old files and open buffers
nnoremap <leader>h :History<CR>
"Search History
nnoremap <leader><C-h> :History/<CR> 
"Command History
nnoremap <leader>c :History:<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>C :Colors<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>ww :Windows<CR>
nnoremap <leader>s :Snippets<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>l :Lines<CR>

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


