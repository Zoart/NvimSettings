-- https://github.com/wbthomason/packer.nvim

vim.opt.number = true
vim.opt.relativenumber = true --Make relative number default
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.termguicolors = true

vim.cmd[[set scrolloff=9]]
vim.cmd[[set autoindent]]
vim.cmd[[set noswapfile]]
vim.cmd[[set ttyfast]]
vim.cmd[[]]


vim.cmd[[set cc=80]]

vim.g.mapleader = ' '

vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')



local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing packer...')
  local packer_url = 'https://github.com/wbthomason/packer.nvim'
  vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
  print('Done.')

  vim.cmd('packadd packer.nvim')
  install_plugins = true
end


require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'shaunsingh/nord.nvim'

	-- Telescope
	use "nvim-lua/plenary.nvim"
	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Treesitter
	use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
	
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	

  if install_plugins then
    require('packer').sync()
  end
end)

if install_plugins then
  return
end

vim.cmd[[colorscheme nord]]

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Treesitter settings
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "cpp", "lua", "html", "css", "javascript", "rust", "go", "c_sharp", "json", "php", "python", "vue" },

	highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- lsp config

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

require'lspconfig'.cssls.setup{}
require'lspconfig'.html.setup{}
