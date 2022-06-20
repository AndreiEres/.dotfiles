hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='code'

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

let s:white               = { "gui": "#d4d4d4", "cterm": "251" }
let s:actual_white        = { "gui": "#FFFFFF", "cterm": "231" }
let s:black               = { "gui": "#1e1e1e", "cterm": "0"   }
let s:light_black         = { "gui": "#353535", "cterm": "8"   }
let s:gray                = { "gui": "#808080", "cterm": "243" }
let s:light_gray          = { "gui": "#c6c6c6", "cterm": "250" }
let s:red                 = { "gui": "#f14c4c", "cterm": "1"   }
let s:blue                = { "gui": "#569cd6", "cterm": "4"   }
let s:green               = { "gui": "#0dbc79", "cterm": "10"  }
let s:yellow              = { "gui": "#ffcc00", "cterm": "11"  }
let s:brown               = { "gui": "#CE9178", "cterm": "3"   }

let s:bg                  = s:black
let s:comment             = s:gray
let s:norm                = s:white
let s:const               = s:blue
let s:string              = s:brown
let s:visual              = s:light_black
let s:warning             = s:yellow
let s:error               = s:red

call s:h("Normal",          {"bg": s:bg, "fg": s:norm})
call s:h("Cursor",          {"bg": s:blue, "fg": s:norm })
call s:h("Comment",         {"fg": s:comment})

call s:h("Constant",        {"fg": s:const})
hi! link Character          Constant
hi! link Number             Constant
hi! link Boolean            Constant
hi! link Float              Constant

call s:h("String",          {"fg": s:brown})

call s:h("Identifier",      {"fg": s:blue})
hi! link Function           Normal

call s:h("Statement",       {"fg": s:blue})
hi! link Conditonal         Statement
hi! link Repeat             Statement
hi! link Label              Normal
hi! link Operator           Normal
hi! link Keyword            Statement
hi! link Exception          Statement

hi! link PreProc            Normal
hi! link Include            PreProc
hi! link Define             PreProc
hi! link Macro              PreProc
hi! link PreCondit          PreProc

hi! link Type               Normal
hi! link StorageClass       Type
hi! link Structure          Type
hi! link Typedef            Type

call s:h("Special",         {"fg": s:blue})
hi! link SpecialChar        Normal
hi! link Tag                Normal
hi! link Delimiter          Normal
hi! link SpecialComment     Normal
hi! link Debug              Normal

call s:h("Underlined",      {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",          {"fg": s:bg})
call s:h("Error",           {"fg": s:actual_white, "bg": s:red, "cterm": "bold"})
call s:h("Todo",            {"fg": s:actual_white, "bg": s:red, "gui": "bold", "cterm": "bold"})
call s:h("SpecialKey",      {"fg": s:green})
call s:h("NonText",         {"fg": s:bg})
call s:h("Directory",       {"fg": s:blue})
call s:h("ErrorMsg",        {"fg": s:red})
call s:h("IncSearch",       {"bg": s:visual})
call s:h("Search",          {"bg": s:visual})
call s:h("MoreMsg",         {"fg": s:gray, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",          {"fg": s:comment})
call s:h("CursorLineNr",    {"fg": s:light_gray, "bg": s:bg})
call s:h("Question",        {"fg": s:red})
call s:h("StatusLine",      {"bg": s:visual})
call s:h("StatusLineNC",    {"bg": s:visual, "fg": s:gray})
call s:h("VertSplit",       {"bg": s:visual, "fg": s:visual})
call s:h("Title",           {"fg": s:blue})
call s:h("Visual",          {"bg": s:visual})
call s:h("VisualNOS",       {"bg": s:comment})
call s:h("WarningMsg",      {"fg": s:red})
call s:h("WildMenu",        {"fg": s:bg, "bg": s:norm})
call s:h("Folded",          {"fg": s:gray})
call s:h("FoldColumn",      {"fg": s:comment})
call s:h("DiffAdd",         {"fg": s:green})
call s:h("DiffDelete",      {"fg": s:red})
call s:h("DiffChange",      {"fg": s:blue})
call s:h("DiffText",        {"fg": s:blue})
call s:h("SignColumn",      {"fg": s:green})

call s:h("SpellBad",        {"gui": "underline", "sp": s:red})
call s:h("SpellCap",        {"gui": "underline", "sp": s:green})
call s:h("SpellRare",       {"gui": "underline", "sp": s:red})
call s:h("SpellLocal",      {"gui": "underline", "sp": s:green})

call s:h("Pmenu",           {"fg": s:norm, "bg": s:visual})
call s:h("PmenuSel",        {"fg": s:blue, "bg": s:visual})
call s:h("PmenuSbar",       {"fg": s:norm, "bg": s:visual})
call s:h("PmenuThumb",      {"fg": s:norm, "bg": s:visual})
call s:h("TabLine",         {"fg": s:light_gray, "bg": s:visual})
call s:h("TabLineSel",      {"fg": s:actual_white, "bg": s:bg})
call s:h("TabLineFill",     {"fg": s:norm, "bg": s:visual})
call s:h("CursorColumn",    {"bg": s:bg})
call s:h("CursorLine",      {"bg": s:visual})
call s:h("ColorColumn",     {"bg": s:comment})

call s:h("MatchParen",      {"bg": s:comment, "fg": s:norm})
call s:h("qfLineNr",        {"fg": s:gray})

call s:h("htmlH1",          {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",          {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",          {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",          {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",          {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",          {"bg": s:bg, "fg": s:norm})

call s:h("CocErrorSign",    {"fg": s:error})
call s:h("CocWarningSign",  {"fg": s:warning})
call s:h("Conceal",         {"gui": "underline"})

hi link CocInfoSign         Normal
hi link Conceal             CocUnderline
hi link diffRemoved         DiffDelete
hi link diffAdded           DiffAdd

hi! link typescriptTypeReference Normal
hi! link typescriptAliasDeclaration Normal
hi! link typescriptPaymentShippingOptionProp Normal
hi! link typescriptArrayMethod Normal
hi! link typescriptFuncType Normal

hi! link jsxComponentName Keyword

hi! link pythonImport Keyword
