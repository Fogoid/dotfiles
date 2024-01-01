local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { 'nvim-lua/plenary.nvim' },
    { 
        'nvim-telescope/telescope.nvim', 
        dependencies = {
           'nvim-lua/plenary.nvim'     
        }
    },
    { 'nvim-treesitter/nvim-treesitter' },
    {
        'catppuccin/nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
        end
    },
    { 'mbbill/undotree' },

    { 'yamatsum/nvim-cursorline' },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

    -- Git
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },

    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
           'nvim-lua/plenary.nvim'     
        }
    },
    { 'gelguy/wilder.nvim' },

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            -- Autocomplete
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        }
    },
    { 
        "rcarriga/nvim-dap-ui", 
        dependencies = {
            "mfussenegger/nvim-dap"
        } 
    },
    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap"
        } 
    },
    { 'stevearc/overseer.nvim' }
})

