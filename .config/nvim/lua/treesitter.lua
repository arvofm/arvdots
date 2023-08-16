------------------------
-- a basic treesitter
-- by arvo
------------------------

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "javascript", "html", "css", "cpp", "bash", "markdown", "latex" },
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        disable = { "latex" },
        additional_vim_regex_highlighting = { "latex", "markdown" },
    },
    incremental_selection = {
    enable = true,
    keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true
    },
}

