----------------------
-- front-end support
-- by arvo
----------------------

vim.g.user_emmet_install_global = 0
vim.cmd('autocmd FileType html,css EmmetInstall')

vim.g.user_emmet_leader_key = ','

vim.cmd[[
let g:user_emmet_settings = {
\  'variables': {'lang': 'en-US'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<meta name=\"description\" content=\"be quiet and drive far away\">\n"
\              ."\t<title>I Hope Suckers Suck Less</title>\n"
\              ."\t"
\              .'<link rel="stylesheet" href="./style.css">'
\              ."\n"
\              ."\t"
\              .'<link rel="stylesheet" media="(max-width: 768px)" href="./tablet.css">'
\              ."\n"
\              ."\t"
\              .'<link rel="stylesheet" media="(max-width: 500px)" href="./mobile.css">'
\              ."\n"
\              ."\t"
\              .'<link rel="icon" href="./favicon.ico" type="image/x-icon">'
\              ."\n"
\              ."\t"
\              .'<script src="app.js" defer></script>'
\              ."\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}
]]

