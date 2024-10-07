return {
    { 'nvim-neotest/nvim-nio' },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                "fredrikaverpil/neotest-golang",
            },
        },
        config = function()
            neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-golang")({ runner = "gotestsum" }), -- Registration with config
                },
            })

            vim.keymap.set('n', '<Leader>tf', function() neotest.run.run(vim.fn.expand("%")) end)
        end,
    },
}
