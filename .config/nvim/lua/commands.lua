-----------------------
-- vim user-defined commands
-- by arvo
-----------------------

local filetype = vim.filetype.match({ buf = 0 })

if (filetype == "plaintex") then
    vim.cmd('command -nargs=0 TemplateArticle :read $HOME/.config/nvim/lua/templates/tex/article.tex')
    vim.cmd('command -nargs=0 TemplatePrereport :read $HOME/.config/nvim/lua/templates/tex/prereport.tex')
    vim.cmd('command -nargs=0 TemplateReport :read $HOME/.config/nvim/lua/templates/tex/report.tex')
end
