" Name:       paragon.vim
" Version:    0.5
" Maintainer: Sean Dewar <https://github.com/seandewar>
" License:    The MIT License (MIT)
"
" A minimal colour scheme for Vim and Neovim based on paramount:
" https://github.com/owickstrom/vim-colors-paramount
"
" Also borrows some ideas from Chinmay Dalal's alabaster port:
" https://sr.ht/~p00f/alabaster.nvim
"
" Unlike the name "paramount", "paragon" has no real meaning.
" The name was chosen because it also begins with a "p".
" However, @3N4N came up with a great excuse for me:
"
" > Well paragon means people with high virtue.
" > It's similar, like, in a metaphorical sense. :)

highlight clear
let g:colors_name = 'paragon'

if &background ==# 'dark'
    let s:accent0          = #{gui: '#a3a3eb', cterm: 147}
    let s:accent1          = #{gui: '#ebc7a3', cterm: 223}

    let s:ok               = #{gui: '#69c5a7', cterm: 79}
    let s:warn             = #{gui: '#faeb96', cterm: 229}
    let s:bad              = #{gui: '#e58787', cterm: 174}

    let s:fg0              = #{gui: '#dadada', cterm: 253}
    let s:fg1              = #{gui: '#cacaca', cterm: 251}
    let s:fg2              = #{gui: '#aaaaaa', cterm: 248}
    let s:fg3              = #{gui: '#9c9c9c', cterm: 247}

    let s:bg0              = #{gui: '#0c0c0c', cterm: 232}
    let s:bg1              = #{gui: '#181818', cterm: 234}
    let s:bg2              = #{gui: '#242424', cterm: 235}
    let s:bg3              = #{gui: '#303030', cterm: 236}

    let s:bg_on            = s:bg2
    let s:bg_off           = s:bg1
else
    let s:accent0          = #{gui: '#2626ae', cterm: 19}
    let s:accent1          = #{gui: '#823d1d', cterm: 130}

    let s:ok               = #{gui: '#005b44', cterm: 23}
    let s:warn             = #{gui: '#856c00', cterm: 94}
    let s:bad              = #{gui: '#9b2323', cterm: 124}

    let s:fg0              = #{gui: '#2f2f2f', cterm: 236}
    let s:fg1              = #{gui: '#232323', cterm: 235}
    let s:fg2              = #{gui: '#464646', cterm: 238}
    let s:fg3              = #{gui: '#515151', cterm: 239}

    let s:bg0              = #{gui: '#f2f2f2', cterm: 231}
    let s:bg1              = #{gui: '#e7e7e7', cterm: 254}
    let s:bg2              = #{gui: '#d9d9d9', cterm: 253}
    let s:bg3              = #{gui: '#c8c8c8', cterm: 251}

    let s:bg_on            = s:bg1
    let s:bg_off           = s:bg2
endif

let s:accent_sel           = s:accent1
let s:accent_unsel         = s:accent0

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style) abort
    execute 'highlight' a:group
            \ 'guifg='   has_key(a:style, 'fg')    ? a:style.fg.gui   : 'NONE'
            \ 'guibg='   has_key(a:style, 'bg')    ? a:style.bg.gui   : 'NONE'
            \ 'guisp='   has_key(a:style, 'sp')    ? a:style.sp.gui   : 'NONE'
            \ 'gui='     has_key(a:style, 'gui')   ? a:style.gui      : 'NONE'
            \ 'ctermfg=' has_key(a:style, 'fg')    ? a:style.fg.cterm : 'NONE'
            \ 'ctermbg=' has_key(a:style, 'bg')    ? a:style.bg.cterm : 'NONE'
            \ 'cterm='   has_key(a:style, 'cterm') ? a:style.cterm    : 'NONE'
endfunction

if get(g:, 'paragon_transparent_bg')
    call s:h('Normal', #{fg: s:fg0})
else
    call s:h('Normal', #{fg: s:fg0, bg: s:bg0})
endif

" Syntax Highlights: {{{1
call s:h('Comment', #{fg: s:accent1})

highlight! link Constant Identifier
highlight! link Boolean Constant
call s:h('Number', #{fg: s:accent0})
highlight! link Float Number
call s:h('Character', #{fg: s:accent0})
highlight! link String Character

highlight! link Identifier Normal
highlight! link Function Identifier

call s:h('Keyword', #{fg: s:fg1})
highlight! link Conditonal Keyword
highlight! link Repeat Keyword
highlight! link Statement Keyword
highlight! link Exception Keyword
highlight! link Label Keyword
call s:h('Operator', #{fg: s:fg2})

highlight! link PreProc Identifier
highlight! link Include PreProc
highlight! link Define PreProc
highlight! link PreCondit PreProc

highlight! link Type Identifier
highlight! link StorageClass Keyword
highlight! link Structure Keyword
highlight! link Typedef Type

call s:h('Special', #{fg: s:fg1})
call s:h('SpecialChar', #{fg: s:accent0, gui: 'bold', cterm: 'bold'})
highlight! link Delimiter Special
call s:h('SpecialComment', #{fg: s:accent1, gui: 'italic', cterm: 'italic'})
call s:h('Debug', #{fg: s:fg1})

call s:h('Underlined', #{gui: 'underline', cterm: 'underline'})
highlight! link Tag Underlined
call s:h('Error', #{fg: s:bad, gui: 'bold', cterm: 'bold'})
highlight! link Todo SpecialComment

" Other Highlights: {{{1
call s:h('NonText', #{fg: s:fg3})
highlight! link Folded NonText
highlight! link EndOfBuffer NonText
call s:h('Ignore', #{fg: s:fg3})
highlight! link Conceal Ignore
highlight! link Whitespace Ignore
call s:h('SpecialKey', #{fg: s:fg1, gui: 'bold', cterm: 'bold'})

call s:h('Visual', #{fg: s:bg0, bg: s:fg1})
call s:h('VisualNOS', #{fg: s:bg3, bg: s:fg3})

call s:h('Search', #{fg: s:bg0, bg: s:accent_unsel})
call s:h('IncSearch', #{fg: s:bg0, bg: s:accent_sel})
highlight! link CurSearch IncSearch

call s:h('DiffAdd', #{fg: s:bg0, bg: s:ok})
call s:h('DiffDelete', #{fg: s:bg0, bg: s:bad})
call s:h('DiffText', #{fg: s:bg0, bg: s:warn})
call s:h('DiffChange', #{bg: s:bg1})

call s:h('SpellBad', #{gui: 'undercurl', cterm: 'underline', sp: s:bad})
call s:h('SpellCap', #{gui: 'undercurl', cterm: 'underline', sp: s:warn})
call s:h('SpellRare', #{gui: 'undercurl', cterm: 'underline', sp: s:ok})
call s:h('SpellLocal', #{gui: 'undercurl', cterm: 'underline', sp: s:fg0})

call s:h('ErrorMsg', #{fg: s:bad})
call s:h('WarningMsg', #{fg: s:warn})
call s:h('MoreMsg', #{fg: s:accent0})
highlight! link ModeMsg MoreMsg
call s:h('Title', #{fg: s:fg1})
call s:h('Question', #{fg: s:accent1})
call s:h('Directory', #{fg: s:accent0})

call s:h('CursorLine', #{bg: s:bg1})
highlight! link CursorColumn CursorLine
call s:h('ColorColumn', #{bg: s:bg2})

call s:h('CursorLineNr', #{fg: s:fg0, bg: s:bg1})
call s:h('LineNr', #{fg: s:fg3})
call s:h('SignColumn', #{fg: s:accent0})
call s:h('FoldColumn', #{fg: s:fg3})

call s:h('StatusLine', #{fg: s:fg0, bg: s:bg_on})
call s:h('StatusLineNC', #{fg: s:fg3, bg: s:bg_off})
call s:h('VertSplit', #{fg: s:bg_off})

highlight! link TabLine StatusLineNC
highlight! link TabLineSel StatusLine
highlight! link TabLineFill TabLine

call s:h('QuickFixLine', #{bg: s:bg_on})
call s:h('WildMenu', #{fg: s:bg0, bg: s:fg0})

call s:h('Pmenu', #{fg: s:fg0, bg: s:bg1})
highlight! link PmenuSel Search
highlight! link PmenuThumb Search
highlight! link PmenuSbar Pmenu

" Standard Plugins: {{{1
" c.vim
highlight! link cUserLabel Identifier

" diff.vim
call s:h('diffAdded', #{fg: s:ok})
call s:h('diffRemoved', #{fg: s:bad})
call s:h('diffChanged', #{fg: s:warn})

" help.vim
highlight! link helpHyperTextJump Tag
highlight! link helpURL Underlined

" javascript.vim
highlight! link javaScriptFunction Keyword
highlight! link javaScriptBraces Operator
highlight! link javaScriptParens Operator

" lua.vim
highlight! link luaFunction Keyword

" matchparen.vim
call s:h('MatchParen', #{fg: s:accent_sel, bg: s:bg_on,
            \            gui: 'bold', cterm: 'bold'})

" rust.vim
highlight! link rustModPath Identifier
highlight! link rustSelf Keyword

" vim.vim
highlight! link vimCommentTitle SpecialComment
highlight! link vimCommentString Comment
highlight! link vimHiBang Special
highlight! link vimOperParen Special

" zig.vim
highlight! link zigDummyVariable Special
highlight! link zigEscape SpecialChar
highlight! link zigMacro Keyword
highlight! link zigMultilineStringDelimiter String
highlight! link zigVarDecl Keyword

" Neovim: {{{1
if !has('nvim')
    finish
endif

" New default colors in 0.10 no longer have links to some groups, restore them
highlight! link WinSeparator VertSplit
highlight! link NormalFloat Pmenu

highlight! link FloatTitle NormalFloat
call s:h('FloatBorder', #{fg: s:fg2, bg: s:bg1})

" vim.diagnostic
call s:h('DiagnosticOk', #{fg: s:ok})
call s:h('DiagnosticError', #{fg: s:bad})
call s:h('DiagnosticWarn', #{fg: s:warn})
call s:h('DiagnosticHint', #{fg: s:accent0})
highlight! link DiagnosticInfo Normal

" New default DiagnosticFloating* colors in 0.10 no longer link to Diagnostic*,
" but instead define their own attributes; may be reverted later (neovim#26378)
highlight! link DiagnosticFloatingOk DiagnosticOk
highlight! link DiagnosticFloatingError DiagnosticError
highlight! link DiagnosticFloatingWarn DiagnosticWarn
highlight! link DiagnosticFloatingHint DiagnosticHint
highlight! link DiagnosticFloatingInfo DiagnosticInfo

call s:h('DiagnosticUnderlineOk', #{gui: 'undercurl', cterm: 'underline',
            \                       sp: s:ok})
call s:h('DiagnosticUnderlineError', #{gui: 'undercurl', cterm: 'underline',
            \                          sp: s:bad})
call s:h('DiagnosticUnderlineWarn', #{gui: 'undercurl', cterm: 'underline',
            \                         sp: s:warn})
call s:h('DiagnosticUnderlineHint', #{gui: 'undercurl', cterm: 'underline',
            \                         sp: s:accent0})
call s:h('DiagnosticUnderlineInfo', #{gui: 'undercurl', cterm: 'underline',
            \                         sp: s:fg0})

call s:h('DiagnosticUnnecessary', #{gui: 'undercurl', cterm: 'underline',
            \                       sp: s:fg3})
call s:h('DiagnosticDeprecated', #{gui: 'strikethrough', cterm: 'strikethrough',
            \                      sp: s:fg3})

" vim.treesitter
highlight! link @conceal Conceal
highlight! link @constructor Identifier
highlight! link @function.macro PreProc
highlight! link @label Identifier
highlight! link @module Identifier
highlight! link @tag Identifier
highlight! link @tag.delimiter @punctuation.delimiter
highlight! link @variable Identifier

call s:h('@comment.error', #{fg: s:bad, gui: 'italic', cterm: 'italic'})
call s:h('@comment.warning', #{fg: s:warn, gui: 'italic', cterm: 'italic'})
highlight! link @comment.note SpecialComment

" Change default link away from SpecialChar; reverse that for special characters
" *in constants*
highlight! link @character.special Special

highlight! link @string.documentation Comment
highlight! link @string.escape SpecialChar
" These use SpecialChar by default, which is too noisy.
highlight! link @string.special String

" Overrides for specific languages
highlight! link @constant.comment SpecialComment
highlight! link @number.comment Comment
highlight! link @punctuation.bracket.comment Comment
highlight! link @punctuation.delimiter.comment Comment
highlight! link @label.vimdoc String
highlight! link @markup.link.vimdoc Tag
highlight! link @variable.parameter.vimdoc Special

" vim.lsp; linked to tree-sitter groups where applicable to make things easier
" rust-analyzer
highlight! link @lsp.type.builtinAttribute @attribute.builtin
highlight! link @lsp.type.builtinType @type.builtin
highlight! link @lsp.type.character @character
highlight! link @lsp.type.escapeSequence @string.escape
highlight! link @lsp.type.generic Normal
highlight! link @lsp.type.macro Macro
highlight! link @lsp.type.selfKeyword @keyword
highlight! link @lsp.type.selfTypeKeyword @type.builtin
highlight! link @lsp.type.typeAlias @type

call s:h('LspSignatureActiveParameter', #{bg: s:bg1})
highlight! link LspReferenceText LspSignatureActiveParameter
highlight! link LspReferenceRead LspSignatureActiveParameter
highlight! link LspReferenceWrite LspSignatureActiveParameter
highlight! link LspReferenceTarget LspSignatureActiveParameter

" Work around an Nvim bug when linking to Normal: neovim/neovim#9019.
if exists('*nvim_get_hl') && get(g:, 'paragon_nvim_priority_fix', 1)
            \ && !get(g:, 'paragon_transparent_bg')
lua << EOF
local api = vim.api

for name, def in pairs(api.nvim_get_hl(0, {})) do
    if def.link == "Normal" then
        -- Remove bg attributes from the resolved definition.
        def = api.nvim_get_hl(0, {name = name, link = false})
        def.bg = nil
        def.ctermbg = nil
        api.nvim_set_hl(0, name, def)
    end
end
EOF
endif

" vim: et tw=80 sw=4
