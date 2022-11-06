set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=2
set softtabstop=2

set expandtab
set shiftwidth=2
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


call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'arcticicestudio/nord-vim'

Plug 'preservim/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'feline-nvim/feline.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme nord

" Emmet
let g:user_emmet_leader_key=','
