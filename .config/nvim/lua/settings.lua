-----------------------
-- vim legacy settings
-- by arvo
-----------------------

vim.g.mapleader = ' '
vim.o.background = "dark"
vim.o.equalalways = true
-- vim.o.expandtab = true
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.lazyredraw = true
vim.o.list = true
vim.opt.mouse = 'a'
vim.o.wrap = true
vim.o.number = true
vim.o.numberwidth = 4
vim.o.relativenumber = true
vim.opt.scroll = 5
vim.o.scrolloff = 3
vim.o.shiftwidth = 4
vim.o.showcmd = true
vim.o.smartindent = true
vim.o.so = 5
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.title = true
vim.o.wildmode = 'list,full'
vim.o.path = vim.o.path .. '/usr/include/**' .. ',**'
vim.o.conceallevel = 1
vim.cmd [[ filetype plugin indent on ]]
vim.cmd [[ syntax enable ]]
vim.api.nvim_command([[ hi! Normal guibg=NONE ctermbg=NONE blend=50 ]])
vim.api.nvim_command([[ hi! SignColumn guibg=NONE ctermbg=NONE blend=75 ]])
vim.api.nvim_command([[ hi! NormalNC guibg=NONE ctermbg=NONE blend=25 ]])
-- vim.highlight.priorities = { 'syntax', 'treesitter', 'diagnostics', 'user' }
-- vim.highlight.priorities = { 'syntax', 'diagnostics', 'user' }
