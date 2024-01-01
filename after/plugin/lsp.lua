local lsp_zero = require('lsp-zero').preset({})
local lspconfig = require('lspconfig')
local telescope = require('telescope.builtin')

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {'rust_analyzer', 'gopls', 'lua_ls'},
  handlers = {
    lsp_zero.default_setup,
  }
})

lsp_zero.preset('recommended')
lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>vd", function() telescope.lsp_definitions() end, opts) 
    vim.keymap.set("n", "<leader>vr", function() telescope.lsp_references() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>vi", function() telescope.lsp_implementations() end, opts)
    vim.keymap.set("n", "<C-LeftMouse>", function() telescope.lsp_implementations() end, opts)
    vim.keymap.set("n", "<leader>ho", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>dg', function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set('n', '<leader>ff', '<cmd>LspZeroFormat!<CR>')
end)

lspconfig.rust_analyzer.setup{}
lspconfig.gopls.setup{}
lspconfig.lua_ls.setup{}

local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(),
  ['<C-n>'] = cmp.mapping.select_next_item(),
  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
  ['<C-d>'] = cmp.mapping.scroll_docs(4),
  ['<TAB>'] = cmp.mapping.confirm({ select = true }),
})
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp_mappings
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp_zero.setup()

