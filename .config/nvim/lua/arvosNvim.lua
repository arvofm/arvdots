vim.cmd([[

set background=dark

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'arvosNvim'

" ============================================================================
" Text Markup
" ----------------------------------------------------------------------------

hi Normal                       guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi NonText                      guifg=#6A6A6A guibg=NONE    gui=NONE      ctermfg=008
hi Comment                      guifg=#555555 guibg=NONE    gui=NONE      ctermfg=243
hi Constant                     guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Directory                    guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Identifier                   guifg=#CDCDCD guibg=NONE    gui=NONE      ctermfg=246
hi PreProc                      guifg=#787878 guibg=NONE    gui=NONE      ctermfg=246
hi Special                      guifg=#AAAAAA guibg=NONE    gui=NONE      ctermfg=255
hi Statement                    guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi Title                        guifg=#CCCCCC guibg=NONE    gui=bold      ctermfg=250
hi Type                         guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi SpecialKey                   guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Conditional                  guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Operator                     guifg=#9AAAAA guibg=NONE    gui=NONE      ctermfg=246
hi Exception                    guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Label                        guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Repeat                       guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi Keyword                      guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039
hi String                       guifg=#5697B8 guibg=NONE    gui=NONE      ctermfg=039
hi Character                    guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Boolean                      guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Number                       guifg=#40BDFF guibg=NONE    gui=NONE      ctermfg=039
hi Function                     guifg=#EFEFEF guibg=NONE    gui=NONE      ctermfg=255
hi Underlined                   guifg=#CCCCCC guibg=NONE    gui=underline ctermfg=250

hi Constant                     guifg=#AAAF9D guibg=NONE    gui=NONE      ctermfg=226
hi Directory                    guifg=#A3BE8C guibg=NONE    gui=NONE      ctermfg=226
hi Type                         guifg=#9FC6BA guibg=NONE    gui=NONE      ctermfg=226
hi SpecialKey                   guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
hi Conditional                  guifg=#FFED47 guibg=NONE    gui=NONE      ctermfg=226
hi Exception                    guifg=#FFED47 guibg=NONE    gui=NONE      ctermfg=226
hi Label                        guifg=#88c0d0 guibg=NONE    gui=NONE      ctermfg=226
hi Repeat                       guifg=#FFC270 guibg=NONE    gui=NONE      ctermfg=226
hi Keyword                      guifg=#FFDC42 guibg=NONE    gui=NONE      ctermfg=226
hi String                       guifg=#8FC45F guibg=NONE    gui=NONE      ctermfg=226
hi Character                    guifg=#B48EAD guibg=NONE    gui=NONE      ctermfg=226
hi Boolean                      guifg=#BF616A guibg=NONE    gui=NONE      ctermfg=226
hi Number                       guifg=#DADD9F guibg=NONE    gui=NONE      ctermfg=226

" ============================================================================
" Highlighting
" ----------------------------------------------------------------------------

hi Cursor                       guifg=#6A6A6A guibg=#EFEFEF gui=NONE      ctermfg=008   ctermbg=255
hi CursorIM                     guifg=#191919 guibg=#CCCCCC gui=NONE      ctermfg=008   ctermbg=255
hi CursorColumn                 guifg=NONE    guibg=#292929 gui=NONE      ctermfg=NONE  ctermbg=008     cterm=NONE
hi CursorLine                   guifg=NONE    guibg=#292929 gui=NONE      ctermfg=NONE  ctermbg=008     cterm=NONE
hi Visual                       guifg=#EFEFEF guibg=#515151 gui=NONE      ctermfg=255   ctermbg=008
hi VisualNOS                    guifg=#EFEFEF guibg=#515151 gui=NONE      ctermfg=255   ctermbg=008
hi IncSearch                    guifg=#EFEFEF guibg=#64B2DB gui=NONE      ctermfg=255   ctermbg=039
hi MatchParen                   guifg=#191919 guibg=#40BDFF gui=NONE      ctermfg=235   ctermbg=039
hi Search                       guifg=#EFEFEF guibg=#40BDFF gui=NONE      ctermfg=255   ctermbg=039
hi Error                        guifg=#bf616a guibg=NONE    gui=bold      ctermfg=009   ctermbg=NONE
hi Todo                         guifg=#DEDD5A guibg=NONE    gui=bold      ctermfg=226   ctermbg=NONE

hi IncSearch                    guifg=#191919 guibg=#C3BA4D gui=NONE      ctermfg=255   ctermbg=226
hi MatchParen                   guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
hi Search                       guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226

" ============================================================================
" Messages
" ----------------------------------------------------------------------------

hi Question                     guifg=#64B2DB guibg=NONE    gui=NONE      ctermfg=039   ctermbg=NONE
hi ErrorMsg                     guifg=#bf616a guibg=NONE    gui=bold      ctermfg=009   ctermbg=NONE    cterm=bold
hi MoreMsg                      guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002   ctermbg=NONE
hi WarningMsg                   guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226   ctermbg=NONE

" ============================================================================
" UI
" ----------------------------------------------------------------------------

hi ColorColumn                  guifg=#CCCCCC guibg=#292929 gui=bold      ctermfg=250   ctermbg=008
hi Pmenu                        guifg=#EFEFEF guibg=#191919 gui=NONE      ctermfg=255   ctermbg=000
hi StatusLine                   guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=000   ctermbg=250
hi StatusLineNC                 guifg=#555555 guibg=NONE    gui=NONE      ctermfg=000   ctermbg=246
hi CursorLineNr                 guifg=#DDDDDD guibg=#191919 gui=bold      ctermfg=255   ctermbg=NONE    cterm=bold
hi TabLine                      guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE    cterm=NONE
hi TabLineFill                  guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250   ctermbg=NONE    cterm=NONE
hi LineNr                       guifg=#6A6A6A guibg=#191919 gui=NONE      ctermfg=245   ctermbg=NONE
hi SignColumn                   guifg=#EFEFEF guibg=NONE    gui=NONE      ctermfg=255   ctermbg=NONE
hi VertSplit                    guifg=#555555 guibg=NONE    gui=NONE      ctermfg=000   ctermbg=246
hi PmenuSel                     guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
hi PmenuThumb                   guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
hi FoldColumn                   guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
hi Folded                       guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
hi WildMenu                     guifg=#191919 guibg=#DEDD5A gui=NONE      ctermfg=235   ctermbg=226
hi OverLength                   guifg=NONE    guibg=#4B4B19 gui=NONE      ctermfg=NONE  ctermbg=058

" ============================================================================
" Diff
" ----------------------------------------------------------------------------

hi DiffAdd                      guifg=#87BF19 guibg=NONE    gui=bold      ctermfg=002
hi DiffChange                   guifg=#DEDD5A guibg=NONE    gui=bold      ctermfg=226
hi DiffDelete                   guifg=#FF3D23 guibg=NONE    gui=bold      ctermfg=009
hi DiffText                     guifg=#CCCCCC guibg=NONE    gui=bold      ctermfg=250
hi GitGutterAddDefault          guifg=#87BF19 guibg=NONE    gui=NONE      ctermfg=002
hi GitGutterChangeDefault       guifg=#DEDD5A guibg=NONE    gui=NONE      ctermfg=226
hi GitGutterDeleteDefault       guifg=#FF3D23 guibg=NONE    gui=NONE      ctermfg=009

" ============================================================================
" Spelling
" ----------------------------------------------------------------------------

hi SpellBad                     guisp=#FF3D23 guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=009   cterm=underline
hi SpellCap                     guisp=#87BF19 guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=002   cterm=underline
hi SpellLocal                   guisp=#DEDD5A guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=226   cterm=underline
hi SpellRare                    guisp=#DEDD5A guibg=NONE    gui=undercurl  ctermfg=255  ctermbg=226   cterm=underline

" ============================================================================
" Others
" ----------------------------------------------------------------------------

hi helpSpecial                  guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi helpHyperTextJump            guifg=#40BDFF guibg=NONE    gui=underline ctermfg=039
hi helpNote                     guifg=#CCCCCC guibg=NONE    gui=NONE      ctermfg=250
hi helpHyperTextJump            guifg=#DEDD5A guibg=NONE    gui=underline ctermfg=226   ctermbg=NONE    cterm=underline

" ============================================================================
" Specific Language Syntax
" ----------------------------------------------------------------------------

" Markdown
" ----------------------------------------------------------------------------

hi link                       markdownLinkText            PreProc
hi link                       markdownHeadingDelimiter    Number
hi link                       markdownHeader              Number
hi link                       markdownInlineCode          PreProc
hi link                       markdownFencedCodeBlock     PreProc
hi link                       markdownCodeBlock           PreProc

]])
