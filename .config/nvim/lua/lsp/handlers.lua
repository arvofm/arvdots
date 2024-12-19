---------------------------
-- a neat lsp config
-- by arvo
---------------------------

-- borders
local border = {
      {"X", "FloatBorder"},
      {"─", "FloatBorder"},
      {"X", "FloatBorder"},
      {"│", "FloatBorder"},
      {"X", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"X", "FloatBorder"},
      {"│", "FloatBorder"},
}

-- go to definition in vsplit window
local function goto_definition(split_cmd)
    local util = vim.lsp.util
    local log = require("vim.lsp.log")
    local api = vim.api
    local handler = function(_, result, ctx)
        if result == nil or vim.tbl_isempty(result) then
            local _ = log.info() and log.info(ctx.method, "No location found")
            return nil
        end
        if split_cmd then
            vim.cmd(split_cmd)
        end
        if vim.tbl_islist(result) then
            util.jump_to_location(result[1])
            if #result > 1 then
                util.set_qflist(util.locations_to_items(result))
                api.nvim_command("copen")
                api.nvim_command("wincmd p")
            end
        else
            util.jump_to_location(result)
        end
    end
    return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition('vsplit')
vim.lsp.set_log_level("warn")

-- better diagnostic window hover
local function diagBetter(bufnr)
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end

-- diagnostic globals
vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})

-- diagnostic icons
local signs = { Error = "Х ", Warn = "! ", Hint = "● ", Info = "i " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- show line diagnostics on hover, yes, it is not distractor -- space-q to view all
vim.o.updatetime = 1000
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true })

-- some useful keymaps
local function lsp_keymaps(bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>f',
        function() vim.lsp.buf.format { formatting_options = { tabSize = 4 }, tabSize = 4, async = true } end, bufopts)
    local nopts = { noremap = true, silent = true }
    vim.keymap.set('n', '<A-8>', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<A-9>', vim.diagnostic.goto_next, opts)
end

-- <C-x><C-o> support and keymaps load, per lsp
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    lsp_keymaps()
    diagBetter(bufnr)
    client.server_capabilities.semanticTokensProvider = nil
end

-- Setup each server
local capabilities = require('lsp.lspcmp')
local lspconfig = require('lspconfig')
local lsp_server_list = {
    "lua_ls", "html", "cssmodules_ls", "cssls", "bashls", "jdtls",
    "pyright", "ltex", "tsserver", "clangd", "texlab", "julials", "jsonls"
}

local setup_handlers = {
    ['textDocument/publishDiagnostics'] = function(_, result, ctx, config)
        result.diagnostics = vim.tbl_filter(function(diagnostic)
            return diagnostic.severity ~= vim.lsp.protocol.DiagnosticSeverity.Information
        end, result.diagnostics)

        vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    end,
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

for i = 1, #lsp_server_list do
    lspconfig[lsp_server_list[i]].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        autostart = false,
        handlers = setup_handlers
    }
end

