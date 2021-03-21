-- Bootstrap 'Packer' plugin/package manager
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' 

-- Configure plugins
return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Color themes
  use 'tjdevries/colorbuddy.vim'
  use 'Th3Whit3Wolf/onebuddy'

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'scalameta/nvim-metals'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use {
    'nvim-telescope/telescope-dap.nvim',
    after = {'telescope.nvim', 'nvim-dap'},
    config = function() require'telescope'.load_extension('dap') end
  }

  use 'glepnir/galaxyline.nvim'
end)

