"https://github.com/junegunn/vim-plug

set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=2
set softtabstop=2

set expandtab
set shiftwidth=8
set autoindent

set number
set relativenumber

set wildmode=longest, list
set cc=80

filetype plugin indent on

syntax on
set clipboard=unnamedplus

set ttyfast
set spell
set noswapfile
set backupdir=~/.cache.vim

set termguicolors
set t_Co=256
let python_highlight_all=1

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'arcticicestudio/nord-vim'

Plug 'preservim/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'feline-nvim/feline.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc
Plug 'windwp/nvim-autopairs'

call plug#end()

colorscheme nord

" Emmet
let g:user_emmet_leader_key=','

" Autopairs
lua << EOF
require("nvim-autopairs").setup {}
EOF


" NerdTree
map <silent> <C-n> :NERDTreeFocus<CR>
