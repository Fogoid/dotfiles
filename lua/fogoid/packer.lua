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

  use({ 'maxmx03/fluoromachine.nvim', as = 'fluoromachine', config = function() vim.cmd('colorscheme fluoromachine') end })

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
  --use 'theprimeagen/harpoon'

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'stevearc/overseer.nvim'

  --Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Enhance UI
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
end)

