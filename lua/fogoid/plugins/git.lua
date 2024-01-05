return {
    {
        'tpope/vim-fugitive',
        init = function ()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        init = function()
            require('gitsigns').setup()
        end
    },
}
