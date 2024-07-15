------------------------
-- a neat cmp conf file
-- by arvo
------------------------

require('luasnip/loaders/from_vscode').lazy_load()

local function disable_when_commenting()
    local context = require 'cmp.config.context'
    if vim.api.nvim_get_mode().mode == 'c' then
        return true
    else
        return not context.in_syntax_group("Comment")
    end
end

local lspkind = require('lspkind')
local cmp = require 'cmp'
cmp.setup({
    snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-BS>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        {name = 'supermaven'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip'},
        {name = 'buffer'},
        {name = 'path'},
    }),
    enabled = disable_when_commenting,
    view = {
        entries = {name = 'custom', selection_order = 'near_cursor'}
        -- entries = 'wildmenu'
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            symbol_map = {
                Supermaven = ""
            },
            ellipsis_char = '...',
	    menu = ({
		nvim_lsp = "[LSP]",
		supermaven = "[AI]",
		buffer = "[Buffer]",
		luasnip = "[LuaSnip]",
		nvim_lua = "[Lua]",
		latex_symbols = "[LaTeX]",
	    })
        })
    },
    experimental = {
        ghost_text = false,
    },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    {name = 'buffer'},
    {name = 'path'},
  }
})

return require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

