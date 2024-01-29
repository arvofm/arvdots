---------------------------
-- a neat neovim config
-- by arvo
---------------------------

-- globals
require('plugins')
require('keybinds')
require('settings')

-- colorscheme
-- (gruvbox-material / nightfox-duskfox / rosepine / kanagawa-colorscheme / real-gruvbox / phoenix)
require('phoenix')

-- better syntax highlighting
require('treesitter')

-- bottom status line
require('lualine-status')

-- better tabs
require('barbartabs')

-- side panel file explorer
require('nvimtree-explorer')

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
