----------------------------------
-- another nvimtree file explorer
-- by arvo
----------------------------------

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', 'v', api.node.open.vertical,                opts('Open: Vertical Split'))
end

require("nvim-tree").setup({
    on_attach = on_attach,
      disable_netrw = true,
      hijack_netrw = true,
      view = {
        adaptive_size = true,
        side = "left",
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "name",
        indent_markers = {
          enable = true,
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        debounce_delay = 300,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = {
        dotfiles = true,
      }
})

