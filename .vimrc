"------------------------------------------------------------------------------
" Plugins

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Linter
Plug 'w0rp/ale'
" Display errors
Plug 'vim-airline/vim-airline' 
" Typescript syntax
Plug 'https://github.com/leafgarland/typescript-vim'
" Easy blaming
Plug 'zivyangll/git-blame.vim'
" Gruvbox
Plug 'morhetz/gruvbox'
" Flake8 python syntax/style checker
Plug 'https://github.com/nvie/vim-flake8'
" AutoPairs auto close brackets, quotes, etc
Plug 'https://github.com/jiangmiao/auto-pairs'
call plug#end()

"------------------------------------------------------------------------------
" Mappings

" Mapleader setting
let mapleader = ","

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" Vim Git Blame
map <leader>b :<C-u>call gitblame#echo()<CR>

" Use jk as ESC
inoremap jk <Esc>

"------------------------------------------------------------------------------
" Features

" Sanely reset options when re-sourcing .vimrc
set nocompatible

" Determine filetype and allow auto-indenting
filetype indent plugin on

"Enable syntax highlighting
syntax on

"Encoding
set encoding=utf-8

"NerdTree
let NERDTreeShowHidden=1 " show the hidden things
let NERDTreeIgnore=['\.DS_Store$', '\.git$'] " ignore typical files
"-----------------------------------------------------------------------------
" Must-have options

" Re-use the same window and switch from an unsaved buffer without saving
" first. Keeps an undo history for multiple files when re-using the same
" window
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

"------------------------------------------------------------------------------
" Usability options

" Use case insensitive search except when using caps
set ignorecase
set smartcase

" Copy text in visual mode to clipboard
noremap <leader>y "+y

" Paste text in from keyboard in visual mode
noremap <leader>p "+p

" Allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

" When opening new line and no filetype-specific indenting is enabled, keep the
" same indent as the current line.
set autoindent

" Stop certain movements from always going to the first character of a line
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line
set laststatus=2

" Raise a dialog when quitting without saving instead of failing a command
set confirm

" Don't be very annoying
set visualbell

" Don't be slightly annoying
set t_vb=

" Display line numbers
set number

" Display line number relative to current line
set relativenumber

" Click normally with mouse
set mouse=a

"------------------------------------------------------------------------------
" Ale (linting) customizations
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" Setting linters
let g:ale_linters = {}
let g:ale_linters.javascript = ['eslint']
let g:ale_linters.typescript = ['eslint']
let g:ale_linters.python = ['flake8']

" Ignore things like the line being too long and so on
let g:ale_python_flake8_options = '--ignore=E501,E261,E126,E302'

" Airline plug integration
let g:airline#extensions#ale#enabled = 1

" Show x lines of errors (default: 10)
let g:ale_list_window_size = 3

" Navigate errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Lint check on every key press (default always, normal, never)
" let g:ale_lint_on_text_changed = 'normal'
"------------------------------------------------------------------------------
" Indentation options

" Indent with 2 spaces instead of tabs
setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype go setlocal expandtab tabstop=8 shiftwidth=8 softtabstop=8
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4


"------------------------------------------------------------------------------
" Color scheme
let t_Co=256
colorscheme gruvbox
set background=dark
