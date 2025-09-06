---------------------------
-- a neat neovim config
-- by arvo
---------------------------

-- globals
require('plugins')
require('settings')
require('keybinds')

-- colorscheme
-- (gruvbox-material / nightfox-duskfox / rosepine / kanagawa-colorscheme / real-gruvbox / phoenix / arvosNvim)
-- require('arvosNvim')
vim.cmd("colorscheme base16-windows-nt")

-- treesitter
require('treesitter')

-- bottom status line
require('lualine-status')

-- better tabs
require('barbartabs')

-- colorize colors
require('colorizecolors')

-- html / css support
require('emmethtml')

-- IDE stuff
require('lsp')

-- LaTeX syntax
require('vimtex')

-- snippets
require('ultisnips')

-- finally, all my own
require('commands')

