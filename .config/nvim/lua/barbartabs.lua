----------------------------
-- better tabs with barbar
-- by arvo
----------------------------

require'bufferline'.setup {
    animation = true,
    auto_hide = true,
    tabpages = true,
    closable = true,
    clickable = false,
    icons = { filetype = { enabled = true } },
    maximum_padding = 1,
    maximum_length = 30,
}
