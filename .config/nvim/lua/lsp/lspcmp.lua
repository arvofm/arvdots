------------------------
-- a neat cmp conf file
-- by arvo
------------------------

require('luasnip/loaders/from_vscode').lazy_load()

local kind_icons = {
        Text = "T",
        Method = "M",
        Function = "F",
        Constructor = "C",
        Field = "f",
        Variable = "V",
        Class = "c",
        Interface = "I",
        Module = "m",
        Property = "P",
        Unit = "U",
        Value = "v",
        Enum = "E",
        Keyword = "K",
        Snippet = "S",
        Color = "C",
        File = "F",
        Reference = "R",
        Folder = "D",
        EnumMember = "e",
        Constant = "C",
        Struct = "s",
        Event = "E",
        Operator = "O",
        TypeParameter = "T",
        Supermaven = ""
}

local function disable_when_commenting()
    local context = require 'cmp.config.context'
    if vim.api.nvim_get_mode().mode == 'c' then
        return true
    else
        return not context.in_syntax_group("Comment")
    end
end

local cmp = require 'cmp'
cmp.setup({
    completion = {
        autocomplete = false,
        keyword_length = 2,
    },
    snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
    window = {
        completion = {
            border = 'none',
            winhighlight = 'Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        },
        documentation = { border = 'single' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-BS>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Esc>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.close()
            else
                fallback()
            end
        end, { 'i' }),
    }),
    sources = cmp.config.sources({
        { name = 'supermaven' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    enabled = disable_when_commenting,
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
        -- entries = 'wildmenu'
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind]) -- This concatenates the icons with the name of the item kind
            -- Source
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                supermaven = "[AI]",
                buffer = "[Buffer]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
        end,
    },
    experimental = {
        ghost_text = false,
    },
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
        { name = 'path' },
    }
})

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = '#CDCDCD' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = '#454545', strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = '#F2F2F2' })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = '#454545' })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = '#00CD00' })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#DDDD00' })

vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#282828' }) -- Example color for border
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#191919' })       -- Example background for menu
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#454545' })    -- Example background for selected item



return require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
