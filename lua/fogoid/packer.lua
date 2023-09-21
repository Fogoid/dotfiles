-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                          , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 'catppuccin/nvim', as = 'catppuccin', config = function() vim.cmd('colorscheme catppuccin') end })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'L3MON4D3/LuaSnip'},     -- Required
	        
          {'Hoffs/omnisharp-extended-lsp.nvim'} -- Additional for omnisharp config
      }
  }

  use 'mbbill/undotree'

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'stevearc/overseer.nvim'

  --Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Enhance UI
  use 'dinhhuy258/sfm.nvim'
  use({
      'willothy/nvim-cokeline',
      requires = {
          "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
          "kyazdani42/nvim-web-devicons", -- If you want devicons
      }
  })
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
    -- Session management
    use 'rmagatti/auto-session'
end)

