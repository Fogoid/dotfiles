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
        'L3MON4D3/LuaSnip',
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    {
        'hrsh7th/nvim-cmp',
            dependencies = {
            'L3MON4D3/LuaSnip',
            'onsails/lspkind.nvim',
        },
        init = function()
            local lspkind = require('lspkind')
            local cmp = require('cmp')
            local cmp_mappings = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<S-Tab>'] = nil,
                ['<C-Space>'] = cmp.mapping.complete(),
            })

            cmp.setup({
                window = {
                    completion = cmp.config.window.bordered(),    
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                  fields = { "kind", "abbr", "menu" },
                  format = function(entry, vim_item)
                    local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. (strings[1] or "") .. " "
                    kind.menu = "    (" .. (strings[2] or "") .. ")"

                    return kind
                  end,
                },
                mapping = cmp_mappings,
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    end
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                }, {
                    { name = 'buffer' },
                })
            })

        end

    },
    {
        'neovim/nvim-lspconfig',
        init = function()
            local lspconfig = require('lspconfig')
            local capabilites = require('cmp_nvim_lsp').default_capabilities()
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
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'nvim-telescope/telescope.nvim',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            "folke/trouble.nvim",
        }
    },
}
