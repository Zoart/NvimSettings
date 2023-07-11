"~/.config/nvim/init
"https://github.com/junegunn/vim-plug

set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=2
set softtabstop=2

set scrolloff=9

set expandtab
set shiftwidth=2
set autoindent

set number
" set relativenumber

set wildmode=longest, list

" file autocompletion
set wildmenu
set cc=80

inoremap ii <esc>

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

" Resize text
" Decrease font size
nnoremap <C--> :set guifont-=1<CR>

" Increase font size
nnoremap <C-=> :set guifont+=1<CR>


" Delete all lines
nnoremap da :%d<CR>

" Copy all lines
nnoremap ca :%y+<CR>

" Enable wordcount
let g:airline#extensions#wordcount#enabled = 1
" Add notes to filetypes
let g:airline#extensions#wordcount#filetypes = '\vnotes|help|markdown|rst|org|text|asciidoc|tex|mail'

:autocmd InsertLeave * silent! update

call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'arcticicestudio/nord-vim'

Plug 'preservim/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'feline-nvim/feline.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'windwp/nvim-autopairs'

" JS/JSX/TS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'

" Autopair
Plug 'windwp/nvim-autopairs'


call plug#end()

colorscheme nord

" Emmet
let g:user_emmet_leader_key=','


" NerdTree
map <silent> <C-n> :NERDTreeFocus<CR>

" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>

" Autocomplit

set completeopt=menu,menuone,noselect

" Autopairs
lua << EOF
require("nvim-autopairs").setup {}
EOF

