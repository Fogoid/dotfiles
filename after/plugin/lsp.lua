local lsp = require('lsp-zero').preset({})
local lspconfig = require('lspconfig')
local omnisharpExt = require('omnisharp_extended')
local telescope = require('telescope.builtin')

lsp.preset('recommended')

lsp.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
    
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>vd", function() omnisharpExt.telescope_lsp_definitions() end, opts) 
    vim.keymap.set("n", "<leader>vr", function() telescope.lsp_references() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>vi", function() telescope.lsp_implementations() end, opts)
    vim.keymap.set("n", "<C-LeftMouse>", function() telescope.lsp_implementations() end, opts)
    vim.keymap.set("n", "<leader>ho", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>qa', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>dg', function() vim.diagnostic.open_float() end, opts)
end)

local omnisharpProject = vim.fn.input('Omnisharp Project:')
lspconfig.omnisharp.setup{
    cmd = { "dotnet", "C:/DevTools/Omnisharp/Omnisharp.dll", "-s", omnisharpProject },

    handlers = {
        ["textDocument/definition"] = omnisharpExt.handler
    },

    enable_roslyn_analyzers = true,

    enable_import_completion = true,

    organize_imports_on_format = true
}

lspconfig.rust_analyzer.setup{}
lspconfig.golangci_lint_ls.setup{}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<TAB>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['rust_analyser'] = {'rust'},
        ['omnisharp'] = {'c_sharp'}
    }
})

lsp.setup()

