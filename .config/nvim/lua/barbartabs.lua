----------------------------
-- better tabs with barbar
-- by arvo
----------------------------

--require'bufferline'.setup {
require'barbar'.setup {
    animation = false,
    auto_hide = true,
    tabpages = true,
    closable = true,
    clickable = false,
    icons = {
        button = false,
        filetype = { enabled = false },
        separator = {left = '|', right = ''},
        separator_at_end = true,
        modified = {button = '●'},
        inactive = {separator = {left='', right=''}},
        pinned = {button = '♦', filename = true},
    },
}

