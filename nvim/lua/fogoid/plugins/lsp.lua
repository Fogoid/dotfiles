return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'williamboman/mason.nvim',
        init = function()
            require('mason').setup()
        end,
        lazy = false
    },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'neovim/nvim-lspconfig',
        init = function()
            local lspconfig = require('lspconfig')
            local capabilites = require('blink.cmp').get_lsp_capabilities()
            local telescope = require('telescope.builtin')
            local trouble = require('trouble.sources.telescope')

            lspconfig.rust_analyzer.setup {
                capabilities = capabilities,
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            enable = false;
                        }
                    }
                }
            }
            lspconfig.gopls.setup { 
                capabilites = capabilites,
                settings = {
                    gopls = {
                        buildFlags = {"-tags=integration"},
                    },
                },
                init_options = {
                    buildFlags = {"-tags=integration"},
                },
            }
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "<leader>gr", function() telescope.lsp_references() end, opts)
                    vim.keymap.set("n", "<leader>gd", function() telescope.lsp_definitions() end, opts)
                    vim.keymap.set("n", "<C-LeftMouse>", function() telescope.lsp_definitions() end, opts)
                    vim.keymap.set("n", "<leader>gi", function() telescope.lsp_implementations() end, opts)
                    vim.keymap.set("n", "<leader>gm", function() telescope.lsp_document_symbols() end, opts)
                    vim.keymap.set("n", "<leader>gt", function() telescope.lsp_type_definitions() end, opts)
                    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set("n", "<leader>gh", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<leader>vw', '<cmd>Trouble diagnostics toggle<cr>', opts)
                    vim.keymap.set('n', '<leader>vd', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', opts)
                    vim.keymap.set('n', '<leader>ff', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })

            local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end,
        dependencies = {
            'saghen/blink.cmp',
            'nvim-telescope/telescope.nvim',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            "folke/trouble.nvim",
        }
    },
}
