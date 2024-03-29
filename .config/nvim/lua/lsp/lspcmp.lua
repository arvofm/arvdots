------------------------
-- a neat cmp conf file
-- by arvo
------------------------

local kind_icons = {
  Text = "󰊄",
  Method = "",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "󰕳",
  Property = "",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌆",
  Snippet = "",
  Color = "",
  File = "󱔗",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}

require('luasnip/loaders/from_vscode').lazy_load()

local function disable_when_commenting()
    local context = require 'cmp.config.context'
    if vim.api.nvim_get_mode().mode == 'c' then
        return true
    else
        return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
    end
end

local function load_icons(entry, vim_item)
    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
    vim_item.menu = ({
        codeium = "[AI]",
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
    })[entry.source.name]
    return vim_item
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
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        {name = 'codeium'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip'},
        {name = 'buffer'},
        {name = 'path'},
    }),
    enabled = disable_when_commenting,
    view = {
        entries = {name = 'custom', selection_order = 'near_cursor'}
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
            before = load_icons,
        })
    },
    experimental = {
        ghost_text = true,
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

