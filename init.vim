" ~/.config/nvim/init.vim
" https://github.com/junegunn/vim-plug

" General settings
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
set wildmode=longest,list
set wildmenu
set cc=80
set clipboard=unnamedplus
set ttyfast
set spell
set noswapfile
set backupdir=~/.cache/vim
set termguicolors
set t_Co=256
let python_highlight_all=1

" Filetype and syntax settings
filetype plugin indent on
syntax on

" Key mappings
inoremap ii <esc>
nnoremap <C--> :set guifont-=1<CR>
nnoremap <C-=> :set guifont+=1<CR>
nnoremap da :%d<CR>
nnoremap ca :%y+<CR>
nnoremap ,<space> :nohlsearch<CR>

" Airline settings
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = '\vnotes|help|markdown|rst|org|text|asciidoc|tex|mail'

" Automatically update file on insert leave
autocmd InsertLeave * silent! update

" Initialize plugin system
call plug#begin()

" Plugin list
Plug 'scrooloose/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'feline-nvim/feline.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'windwp/nvim-autopairs'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neovim/nvim-lspconfig'

call plug#end()

" Colorscheme
" colorscheme nord

" Emmet
let g:user_emmet_leader_key=','

" NerdTree
map <silent> <C-n> :NERDTreeFocus<CR>

" Autocomplete settings
set completeopt=menu,menuone,noselect

" Autopairs configuration
lua << EOF
require("nvim-autopairs").setup {}
EOF

" LSP configurations
lua << EOF
local lspconfig = require('lspconfig')

-- Enable LSP servers
local servers = {'clangd', 'pyright', 'tsserver', 'html', 'cssls', 'bashls', 'jsonls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup{}
end

-- Django
lspconfig.pyright.setup{
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic"
      }
    }
  }
}

-- Example configuration for Python with pylsp
lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pyflakes = {enabled = false},  -- disable pyflakes
        pylint = {enabled = true},     -- enable pylint
        pyls_mypy = {enabled = true}   -- enable mypy
      }
    }
  }
}

-- Flask
lspconfig.pyright.setup{
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true
      }
    }
  }
}

EOF

" Installation instructions
" To install Neovim and all required components on a Linux system, run the following commands:

" Install Neovim
" sudo apt update
" sudo apt install neovim -y

" Install vim-plug for plugin management
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Install Node.js and npm (required for some language servers)
" curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
" sudo apt install -y nodejs

" Install Python 3 and pip
" sudo apt install python3 python3-pip -y

" Install language servers
" npm install -g pyright
" npm install -g typescript typescript-language-server
" npm install -g vscode-html-languageserver-bin
" npm install -g vscode-css-languageserver-bin
" npm install -g bash-language-server
" npm install -g vscode-json-languageserver

" Install additional tools
" sudo apt install clangd -y
" pip install 'python-language-server[all]'

" After installing the above tools, open Neovim and run :PlugInstall to install the plugins

