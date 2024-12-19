---------------------------
-- vim legacy keybindings
-- by arvo
---------------------------

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true, noremap = true })
end

-- why would i use single
map('i', '"', '""<ESC>i')
map('i', '`', '``<ESC>i')
map('i', '\'', '\'\'<ESC>i')
map('i', '(', '()<ESC>i')
map('i', '[', '[]<ESC>i')
map('i', '{', '{}<ESC>i')


-- tabs navigation
map('n', '<A-Down>', '<CMD>wincmd J<CR>')
map('n', '<A-Left>', '<CMD>wincmd H<CR>')
map('n', '<A-Right>', '<CMD>wincmd L<CR>')
map('n', '<A-Up>', '<CMD>wincmd K<CR>')
map('n', '<A-h>', '<CMD>wincmd h<CR>')
map('n', '<A-j>', '<CMD>wincmd j<CR>')
map('n', '<A-k>', '<CMD>wincmd k<CR>')
map('n', '<A-l>', '<CMD>wincmd l<CR>')

-- retab in visual
map('v', '<', '<gv')
map('v', '>', '>gv')

-- move text up and down
map('n', '<A-C-j>', '<S-v>:m .+1<CR>')
map('n', '<A-C-k>', '<S-v>:m .-2<CR>')

-- prevent visual paste backdrop
map('v', 'p', '"_dP')

-- misc
map('i', '<C-p>', '<C-x><C-i>')
map('i', '<Del>', '<C-w>')
map('n', '<C-s>', '<CMD>w<CR>')
map('n', 'W', '$')

-- tabs movement
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
map('n', '<A-.>', '<Cmd>BufferNext<CR>')
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>')
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
map('n', '<A-0>', '<Cmd>BufferLast<CR>')

