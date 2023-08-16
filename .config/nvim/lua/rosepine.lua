---------------------------------
-- select rosepine colorscheme
-- by arvo
---------------------------------

require('rose-pine').setup({
    disable_background = true,
    disable_loat_background = true,
    dark_variant = 'moon',
    highlight_groups = {
    	ColorColumn = { bg = 'rose' }
	}
})

vim.cmd('colorscheme rose-pine')

