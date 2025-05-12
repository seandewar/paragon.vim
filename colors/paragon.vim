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

" Palette {{{1
if &background ==# 'dark'
    let s:accent0          = #{gui: '#ababed', cterm: 147}
    let s:accent1          = #{gui: '#ebccab', cterm: 223}

    let s:red              = #{gui: '#e58787', cterm: 174}
    let s:yellow           = #{gui: '#faeb96', cterm: 229}
    let s:green            = #{gui: '#69c5a7', cterm: 79}

    let s:fg0              = #{gui: '#e4e4e4', cterm: 254}
    let s:fg1              = #{gui: '#c6c6c6', cterm: 251}
    let s:fg2              = #{gui: '#949494', cterm: 246}

    let s:bg_float         = #{gui: '#080808', cterm: 232}
    let s:bg_norm          = #{gui: '#121212', cterm: 233}
    let s:bg0              = #{gui: '#1c1c1c', cterm: 234}
    let s:bg1              = #{gui: '#262626', cterm: 235}
    let s:bg2              = #{gui: '#303030', cterm: 236}
    let s:bg_active        = #{gui: '#3a3a3a', cterm: 237}
    let s:bg_inactive      = s:bg1
else
    let s:accent0          = #{gui: '#2424b0', cterm: 19}
    let s:accent1          = #{gui: '#90571d', cterm: 94}

    let s:red              = #{gui: '#8d2020', cterm: 88}
    let s:yellow           = #{gui: '#7a6400', cterm: 94}
    let s:green            = #{gui: '#00523d', cterm: 23}

    let s:fg0              = #{gui: '#121212', cterm: 233}
    let s:fg1              = #{gui: '#303030', cterm: 236}
    let s:fg2              = #{gui: '#626262', cterm: 241}

    let s:bg_float         = #{gui: '#eeeeee', cterm: 255}
    let s:bg_norm          = #{gui: '#e4e4e4', cterm: 254}
    let s:bg0              = #{gui: '#dadada', cterm: 253}
    let s:bg1              = #{gui: '#d0d0d0', cterm: 252}
    let s:bg2              = #{gui: '#c6c6c6', cterm: 251}
    let s:bg_active        = s:bg1
    let s:bg_inactive      = #{gui: '#bcbcbc', cterm: 250}
endif

let s:accent_sel           = s:accent1
let s:accent_unsel         = s:accent0

" }}}

" Explicitly redefine most built-in groups to prevent changes to the defaults
" (especially Neovim's) from affecting our colours, even if redundant (like with
" Neovim's "@foo.bar" tree-sitter capture groups; don't rely on their fallbacks)

" Highlight definition function {{{1
" Unlike the typical variant of :highlight, this clears unspecified attributes.
" Adapted from https://github.com/noahfrederick/vim-hemisu/.
function! s:h(group, style) abort
    execute 'highlight clear' a:group '|'
          \ 'highlight' a:group
          \ has_key(a:style, 'fg') ? 'guifg=' .. a:style.fg.gui ..
          \                         ' ctermfg=' .. a:style.fg.cterm : ''
          \ has_key(a:style, 'bg') ? 'guibg=' .. a:style.bg.gui ..
          \                         ' ctermbg=' .. a:style.bg.cterm : ''
          \ has_key(a:style, 'sp') ? 'guisp=' .. a:style.sp.gui : ''
          \ has_key(a:style, 'gui') ? 'gui=' .. a:style.gui : ''
          \ has_key(a:style, 'cterm') ? 'cterm=' .. a:style.cterm : ''
endfunction

" Editor highlights (:help highlight-groups) {{{1
call s:h('ColorColumn', #{bg: s:bg1})
highlight! link Conceal Ignore
highlight! link CurSearch IncSearch
call s:h('Cursor', #{fg: #{gui: 'bg', cterm: 'NONE'},
            \        bg: #{gui: 'fg', cterm: 'NONE'}})
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
highlight! link CursorColumn CursorLine
call s:h('CursorLine', #{bg: s:bg0})
call s:h('Directory', #{fg: s:accent0})
call s:h('DiffAdd', #{fg: s:bg0, bg: s:green})
call s:h('DiffChange', #{bg: s:bg2})
call s:h('DiffDelete', #{fg: s:bg0, bg: s:red})
call s:h('DiffText', #{fg: s:bg0, bg: s:yellow})
highlight! link DiffTextAdd DiffText
highlight! link EndOfBuffer NonText
call s:h('TermCursor', #{gui: 'reverse', cterm: 'reverse'})
call s:h('ErrorMsg', #{fg: s:red})
call s:h('VertSplit', #{fg: s:bg0})  " Vim-only
highlight! link WinSeparator VertSplit  " Nvim-only
highlight! link Folded NonText
call s:h('FoldColumn', #{fg: s:fg2})
call s:h('SignColumn', #{fg: s:accent0})
call s:h('IncSearch', #{fg: s:bg0, bg: s:accent_sel})
highlight! link Substitute Search  " Nvim-only
call s:h('LineNr', #{fg: s:fg2})
highlight! link LineNrAbove LineNr
highlight! link LineNrBelow LineNr
call s:h('CursorLineNr', #{fg: s:fg0, bg: s:bg0})
highlight! link CursorLineFold FoldColumn
highlight! link CursorLineSign SignColumn
call s:h('MatchParen', #{fg: s:accent_sel, bg: s:bg_float,
            \            gui: 'bold', cterm: 'bold'})
highlight! link MessageWindow WarningMsg  " Vim-only
highlight! link ModeMsg Normal
highlight clear MsgArea
highlight! link MsgSeparator StatusLine  " Nvim-only
call s:h('MoreMsg', #{fg: s:accent0})
call s:h('NonText', #{fg: s:fg2, gui: 'bold', cterm: 'bold'})
call s:h('Normal', #{fg: s:fg0, bg: s:bg_norm})
call s:h('NormalFloat', #{fg: s:fg0, bg: s:bg_float})  " Nvim-only
call s:h('FloatBorder', #{fg: s:fg1, bg: s:bg_float})  " Nvim-only
highlight! link FloatTitle NormalFloat  " Nvim-only
highlight! link FloatFooter FloatTitle  " Nvim-only
highlight clear NormalNC  " Nvim-only
call s:h('Pmenu', #{fg: s:fg0, bg: s:bg2})
highlight! link PmenuSel CurSearch
highlight! link PmenuKind Pmenu
highlight! link PmenuKindSel PmenuSel
highlight! link PmenuExtra Pmenu
highlight! link PmenuExtraSel PmenuSel
highlight! link PmenuSbar Pmenu
call s:h('PmenuThumb', #{bg: s:fg2})
call s:h('PmenuMatch', #{gui: 'bold', cterm: 'bold'})
highlight! link PmenuMatchSel PmenuMatch
highlight clear ComplMatchIns
highlight! link PopupNotification WarningMsg  " Vim-only
highlight! link PopupSelected PmenuSel  " Vim-only
call s:h('Question', #{fg: s:accent1})
call s:h('QuickFixLine', #{bg: s:bg2})
call s:h('Search', #{fg: s:bg0, bg: s:accent_unsel})
highlight! link SnippetTabstop Visual  " Nvim-only
call s:h('SpecialKey', #{fg: s:fg1, gui: 'bold', cterm: 'bold'})
call s:h('SpellBad', #{gui: 'undercurl', cterm: 'underline', sp: s:red})
call s:h('SpellCap', #{gui: 'undercurl', cterm: 'underline', sp: s:yellow})
call s:h('SpellLocal', #{gui: 'undercurl', cterm: 'underline', sp: s:fg0})
call s:h('SpellRare', #{gui: 'undercurl', cterm: 'underline', sp: s:green})
call s:h('StatusLine', #{fg: s:fg1, bg: s:bg_active})
call s:h('StatusLineNC', #{fg: s:fg1, bg: s:bg_inactive})
highlight! link StatusLineTerm StatusLine
highlight! link StatusLineTermNC StatusLineNC
highlight! link TabLine StatusLineNC
highlight! link TabLineFill TabLine
highlight! link TabLineSel StatusLine
call s:h('Title', #{gui: 'bold', cterm: 'bold'})
call s:h('Visual', #{fg: s:bg0, bg: s:fg0})
call s:h('VisualNOS', #{fg: s:bg2, bg: s:fg2})
call s:h('WarningMsg', #{fg: s:yellow})
highlight! link Whitespace Ignore  " Nvim-only
highlight! link WildMenu CurSearch
highlight! link WinBar StatusLine  " Nvim-only
highlight! link WinBarNC StatusLineNC  " Nvim-only

" Standard syntax highlights (:help group-name) {{{1
call s:h('Comment', #{fg: s:fg2})
highlight! link Constant Identifier
highlight! link String Character
call s:h('Character', #{fg: s:accent0})
call s:h('Number', #{fg: s:accent0})
highlight! link Boolean Constant
highlight! link Float Number
call s:h('Identifier', #{fg: s:fg0})
highlight! link Function Identifier
highlight! link Statement Keyword
highlight! link Conditonal Keyword
highlight! link Repeat Keyword
highlight! link Label Special
call s:h('Operator', #{fg: s:fg0})
call s:h('Keyword', #{fg: s:fg0})
highlight! link Exception Keyword
highlight! link PreProc Special
highlight! link Include PreProc
highlight! link Define PreProc
highlight! link Macro Define
highlight! link PreCondit PreProc
highlight! link Type Identifier
highlight! link StorageClass Keyword
highlight! link Structure Keyword
highlight! link Typedef Keyword
call s:h('Special', #{fg: s:fg0})
call s:h('SpecialChar', #{fg: s:accent0, gui: 'bold', cterm: 'bold'})
" Annoyingly, most syntax files misuse Tag for tag-like constructs (or just for
" completely random crap), not for things that <C-]> can jump to as intended.
highlight! link Tag Identifier
highlight! link Delimiter Special
call s:h('SpecialComment', #{fg: s:fg2, gui: 'bold', cterm: 'bold'})
highlight! link Debug Statement
call s:h('Underlined', #{gui: 'underline', cterm: 'underline'})
call s:h('Ignore', #{fg: s:fg2})
call s:h('Error', #{fg: s:red})
highlight! link Todo SpecialComment
call s:h('Added', #{fg: s:green})
call s:h('Changed', #{fg: s:yellow})
call s:h('Removed', #{fg: s:red})

" Plugin highlight overrides {{{1
"
" Unlike other groups, these redefinitions don't aim to be exhaustive; these
" just address some personal grievances. As paragon aims to highlight a minimal
" set of syntax constructs, we need not worry as much about plugins'
" questionable highlight choices, which they *love* to make.
"
" Thankfully, Neovim's tree-sitter and LSP-based highlight choices are
" infinitely more consistent.

" help.vim
highlight! link helpHeader Title
highlight! link helpHeadline Title
" Was a correct usage of Tag, but we couldn't trust others to do the same. :-(
highlight! link helpHyperTextJump Underlined
highlight! link helpOption Underlined
highlight! link helpURL Underlined

" pdf.vim
" Was a correct usage of Tag, but we couldn't trust others to do the same. :-(
highlight! link pdfReference Underlined

" vim.vim
" If set, then user probably really wants strings highlighted in comments.
if !exists('g:vimsyn_comment_strings')
    highlight! link vimCommentString Comment
endif
highlight! link vimCommentTitle SpecialComment
highlight! link vimEscape SpecialChar
" Key notation
highlight! link vimBracket SpecialChar
highlight! link vimNotation SpecialChar

" zig.vim
highlight! link zigDummyVariable Special
highlight! link zigEscape SpecialChar
highlight! link zigMultilineStringDelimiter String

" }}}

" Neovim-only logic past this point.
if !has('nvim')
    finish
endif

" Neovim diagnostic highlights (:help diagnostic-highlights) {{{1
call s:h('DiagnosticError', #{fg: s:red})
call s:h('DiagnosticWarn', #{fg: s:yellow})
highlight! link DiagnosticInfo Normal
call s:h('DiagnosticHint', #{fg: s:accent0})
call s:h('DiagnosticOk', #{fg: s:green})

call s:h('DiagnosticVirtualTextError', #{fg: s:red, gui: 'bold', cterm: 'bold'})
call s:h('DiagnosticVirtualTextWarn',
            \ #{fg: s:yellow, gui: 'bold', cterm: 'bold'})
call s:h('DiagnosticVirtualTextInfo', #{fg: s:fg0, gui: 'bold', cterm: 'bold'})
call s:h('DiagnosticVirtualTextHint',
            \ #{fg: s:accent0, gui: 'bold', cterm: 'bold'})
call s:h('DiagnosticVirtualTextOk', #{fg: s:green, gui: 'bold', cterm: 'bold'})

" Previously these used undercurls, but it's too noisy when diagnostics span
" large blocks.
call s:h('DiagnosticUnderlineError', #{fg: s:red})
call s:h('DiagnosticUnderlineWarn', #{fg: s:yellow})
highlight clear DiagnosticUnderlineInfo
highlight clear DiagnosticUnderlineHint
highlight clear DiagnosticUnderlineOk

highlight! link DiagnosticFloatingError DiagnosticError
highlight! link DiagnosticFloatingWarn DiagnosticWarn
highlight! link DiagnosticFloatingInfo DiagnosticInfo
highlight! link DiagnosticFloatingHint DiagnosticHint
highlight! link DiagnosticFloatingOk DiagnosticOk
highlight! link DiagnosticSignError DiagnosticError
highlight! link DiagnosticSignWarn DiagnosticWarn
highlight! link DiagnosticSignInfo DiagnosticInfo
highlight! link DiagnosticSignHint DiagnosticHint
highlight! link DiagnosticSignOk DiagnosticOk

call s:h('DiagnosticDeprecated', #{gui: 'strikethrough', cterm: 'strikethrough',
            \                      sp: s:fg2})
call s:h('DiagnosticUnnecessary', #{bg: s:bg2})

" Neovim tree-sitter highlights (:help treesitter-highlight-groups) {{{1
highlight! link @variable Identifier
highlight! link @variable.builtin Special
highlight! link @variable.parameter @variable
highlight! link @variable.parameter.builtin @variable.builtin
highlight! link @variable.member @variable

highlight! link @constant Constant
highlight! link @constant.builtin Special
highlight! link @constant.macro @constant

highlight! link @module Identifier
highlight! link @module.builtin Special
highlight! link @label Label

highlight! link @string String
highlight! link @string.documentation Comment
highlight! link @string.regexp @string
highlight! link @string.escape SpecialChar
highlight! link @string.special @string
highlight! link @string.special.symbol @string
highlight! link @string.special.path @string
highlight! link @string.special.url Underlined

highlight! link @character Character
highlight! link @character.special @character

highlight! link @boolean Boolean
highlight! link @number Number
highlight! link @number.float Float

highlight! link @type Type
highlight! link @type.builtin Special
highlight! link @type.definition Type

highlight! link @attribute Macro
highlight! link @attribute.builtin Special
highlight! link @property Identifier

highlight! link @function Function
highlight! link @function.builtin Special
highlight! link @function.call @function
highlight! link @function.macro @function

highlight! link @function.method @function
highlight! link @function.method.call @function

highlight! link @constructor Identifier
highlight! link @operator Operator

highlight! link @keyword Keyword
highlight! link @keyword.coroutine @keyword
highlight! link @keyword.function @keyword
highlight! link @keyword.operator @keyword
highlight! link @keyword.import @keyword
highlight! link @keyword.type @keyword
highlight! link @keyword.modifier @keyword
highlight! link @keyword.repeat @keyword
highlight! link @keyword.return @keyword
highlight! link @keyword.debug @keyword
highlight! link @keyword.exception @keyword

highlight! link @keyword.conditional @keyword
highlight! link @keyword.conditional.ternary @operator

highlight! link @keyword.directive @keyword
highlight! link @keyword.directive.define @keyword

highlight! link @punctuation Delimiter  " Usually used as a fallback
highlight! link @punctuation.delimiter @punctuation
highlight! link @punctuation.bracket @punctuation
highlight! link @punctuation.special @punctuation

highlight! link @comment Comment
highlight! link @comment.documentation @comment

call s:h('@comment.error', #{fg: s:red, gui: 'bold', cterm: 'bold'})
call s:h('@comment.warning', #{fg: s:yellow, gui: 'bold', cterm: 'bold'})
highlight! link @comment.todo SpecialComment
highlight! link @comment.note SpecialComment

highlight! link @markup Comment  " Usually used as a fallback
call s:h('@markup.strong', #{gui: 'bold', cterm: 'bold'})
call s:h('@markup.italic', #{gui: 'italic', cterm: 'italic'})
call s:h('@markup.strikethrough', #{gui: 'strikethrough',
            \                       cterm: 'strikethrough'})
highlight! link @markup.underline Underlined

highlight! link @markup.heading Title
highlight! link @markup.heading.1 @markup.heading
highlight! link @markup.heading.2 @markup.heading
highlight! link @markup.heading.3 @markup.heading
highlight! link @markup.heading.4 @markup.heading
highlight! link @markup.heading.5 @markup.heading
highlight! link @markup.heading.6 @markup.heading

highlight clear @markup.quote
highlight! link @markup.math String

highlight! link @markup.link Underlined
highlight! link @markup.link.label @markup.link
highlight! link @markup.link.url @markup.link

highlight clear @markup.raw
highlight! link @markup.raw.block @markup.raw

highlight clear @markup.list
call s:h('@markup.list.checked', #{fg: s:green})
highlight! link @markup.list.unchecked @markup.list

highlight! link @diff.plus Added
highlight! link @diff.minus Removed
highlight! link @diff.delta Changed

highlight! link @tag Identifier
highlight! link @tag.builtin Special
highlight! link @tag.attribute @tag
highlight! link @tag.delimiter Delimiter

" comment
highlight! link @constant.comment SpecialComment
highlight! link @number.comment Comment
highlight! link @punctuation.bracket.comment SpecialComment
highlight! link @punctuation.delimiter.comment SpecialComment

" vimdoc
highlight! link @label.vimdoc String
highlight! link @markup.heading.1.delimiter.vimdoc @markup.heading.1
highlight! link @markup.heading.2.delimiter.vimdoc @markup.heading.2

" Neovim LSP semantic highlights (:help lsp-semantic-highlight) {{{1
highlight link @lsp.type.class @type
highlight link @lsp.type.comment @comment
highlight link @lsp.type.decorator @attribute
highlight link @lsp.type.enum @type
highlight link @lsp.type.enumMember @constant
highlight link @lsp.type.event @type
highlight link @lsp.type.function @function
highlight link @lsp.type.interface @type
highlight link @lsp.type.keyword @keyword
highlight link @lsp.type.macro Macro
highlight link @lsp.type.method @function.method
highlight link @lsp.type.modifier @type.qualifier
highlight link @lsp.type.namespace @module
highlight link @lsp.type.number @number
highlight link @lsp.type.operator @operator
highlight link @lsp.type.parameter @variable.parameter
highlight link @lsp.type.property @property
highlight link @lsp.type.regexp @string.regexp
highlight link @lsp.type.string @string
highlight link @lsp.type.struct @type
highlight link @lsp.type.type @type
highlight link @lsp.type.typeParameter @type.definition
highlight link @lsp.type.variable @variable

" Modifiers
highlight clear @lsp.mod.abstract
highlight clear @lsp.mod.async
highlight clear @lsp.mod.declaration
highlight clear @lsp.mod.defaultLibrary
highlight clear @lsp.mod.definition
highlight! link @lsp.mod.deprecated DiagnosticDeprecated
highlight clear @lsp.mod.documentation
highlight clear @lsp.mod.modification
highlight clear @lsp.mod.readonly
highlight clear @lsp.mod.static

" Neovim LSP other highlights (:help lsp-highlight) {{{1
call s:h('LspReferenceText', #{bg: s:bg2})
highlight! link LspReferenceRead LspReferenceText
highlight! link LspReferenceWrite LspReferenceText
highlight! link LspReferenceTarget LspReferenceText
highlight! link LspInlayHint NonText

highlight! link LspCodeLens NonText
highlight! link LspCodeLensSeparator NonText

highlight! link LspSignatureActiveParameter LspReferenceText

" Neovim workaround for "linking to Normal" bug (neovim/neovim#9019) {{{1
if exists('*nvim_get_hl') && get(g:, 'paragon_nvim_priority_fix', 1)
lua << EOF
local api = vim.api

local function fix_hls()
    for name, def in pairs(api.nvim_get_hl(0, {})) do
        if def.link == "Normal" then
            -- Remove bg attributes from the resolved definition.
            def = api.nvim_get_hl(0, {name = name, link = false})
            def.bg = nil
            def.ctermbg = nil
            api.nvim_set_hl(0, name, def)
        end
    end
end

local augroup = api.nvim_create_augroup("paragon_nvim_priority_fix", {})
local function init_fix()
    -- Changed filetypes may result in new highlights that need fixing.
    api.nvim_create_autocmd("FileType", {
        group = augroup,
        callback = fix_hls,
    })

    fix_hls()
end

if vim.v.vim_did_enter ~= 0 then
    init_fix()
else
    api.nvim_create_autocmd("VimEnter", {
        group = augroup,
        callback = init_fix,
    })
end
EOF
endif

" }}}

" vim: et tw=80 sw=4 fdm=marker fdl=0
