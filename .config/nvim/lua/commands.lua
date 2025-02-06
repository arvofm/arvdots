-----------------------
-- vim user-defined commands
-- by arvo
-----------------------

local filetype = vim.filetype.match({ buf = 0 })

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true, noremap = true })
end

map('i', '<A-i>', '<SPACE>{<CR><CR>}<ESC>ki<TAB>')

if (filetype == "plaintex" or filetype == "tex") then
    vim.cmd [[
        let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/lua/templates/latexsnippets"]
        command -nargs=0 TemplateArticle :read $HOME/.config/nvim/lua/templates/tex/article.tex
        command -nargs=0 TemplatePrereport :read $HOME/.config/nvim/lua/templates/tex/prereport.tex
        command -nargs=0 TemplateReport :read $HOME/.config/nvim/lua/templates/tex/report.tex
        setlocal spell spelllang=en_us
        inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
    ]]
    -- ctrl-l does spellcheck corrections in minor detail

elseif (filetype == "c") then
    map('n', 'co', 'i/*<SPACE><SPACE>*/<ESC>hhi')
    map('i', '<C-c>', '/*<SPACE><SPACE>*/<ESC>hhi')
    map('i', '<A-1>', '()<ESC>i')
    map('i', '<A-2>', '{}<ESC>i')
    map('i', '<A-3>', '[]<ESC>i')
    map('i', '<A-i>', '<ESC>f,vf,di,<SPACE>,<ESC>i')

elseif (filetype == "css" or filetype == "javascript" or filetype == "javascriptreact" or filetype == "typescript") then
    map('i', '<C-c>', '/*<SPACE><SPACE>*/<ESC>hhi')
    map('i', '<A-l>', '<ESC>ddOconsole.log();<ESC>hi')
    map('i', '<A-,>', '<ESC>vbyi<<ESC>ea><CR></<ESC>pa><ESC>O')
    map('i', '<A-.>', '<ESC>bi<<ESC>ea<SPACE>/>')

elseif (filetype == "markdown") then
    map('i', '<A-l>', '- [ ] ')
    map('i', '<A-i>', '**<ESC>i')
    map('i', '<A-b>', '****<ESC>hi')
    map('i', '<A-a>', '[]()<ESC>hhi')
end
