" My personal colorscheme
" You're welcome to use it :]
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "fntlnz"

hi Normal       guifg=black ctermfg=254 guibg=#F4F3F1
hi NonText      guifg=black ctermfg=254
hi comment      guifg=darkgray  ctermfg=darkgray gui=italic
hi constant     guifg=black  ctermfg=254
hi string       guifg=darkgray ctermfg=darkgray
hi identifier   guifg=black  ctermfg=254
hi statement    guifg=black  ctermfg=254 gui=bold cterm=bold
hi define       gui=bold cterm=bold
hi preproc      guifg=black  ctermfg=254
hi type         guifg=black ctermfg=254 gui=bold cterm=bold
hi special      guifg=black ctermfg=254 ctermfg=254
hi Underlined   guifg=black  ctermfg=254 gui=underline cterm=underline
hi label        guifg=black ctermfg=254
hi operator     guifg=black ctermfg=254
hi delimiter    guifg=darkgray ctermfg=darkgray gui=NONE cterm=NONE

hi SpellBad     guibg=#ff2929 ctermbg=124
hi ErrorMsg     guifg=black guifg=254 ctermfg=254
hi WarningMsg   guifg=black  ctermfg=254 gui=bold cterm=bold
hi ModeMsg      guifg=black gui=NONE ctermfg=254
hi MoreMsg      guifg=black gui=NONE ctermfg=254
hi Error        guifg=black  guifg=254 gui=underline ctermfg=254

hi Todo         guifg=black  ctermfg=black ctermfg=black
hi Cursor       guifg=black  ctermfg=254 ctermfg=254
hi Search       guifg=black  ctermfg=black ctermfg=black cterm=NONE
hi IncSearch    guifg=green  guifg=green ctermfg=green ctermfg=green cterm=NONE
hi LineNr       guifg=black  ctermfg=254
hi title        guifg=black gui=bold cterm=bold

hi StatusLine    cterm=none gui=none    guifg=white ctermfg=white guibg=black ctermbg=black
hi StatusLineNC  cterm=none gui=none    guifg=fg    ctermfg=fg    guibg=#cccbca ctermbg=white
hi VertSplit     gui=none   guifg=black ctermfg=254 ctermfg=254

hi Visual        term=reverse  ctermfg=254 ctermfg=254 guifg=black

hi DiffChange    guibg=130 ctermbg=130 guifg=black ctermfg=254 ctermfg=254
hi DiffText      guibg=89 ctermbg=89 guifg=black ctermfg=254 ctermfg=254
hi DiffAdd       guibg=22 ctermbg=22 guifg=black ctermfg=254  ctermfg=254
hi DiffDelete    guibg=88 ctermbg=88 guifg=black ctermfg=254  ctermfg=254

hi Folded        guifg=black  ctermfg=254
hi FoldColumn    guifg=black  guifg=black ctermfg=254  ctermfg=254
hi cIf0          guifg=black ctermfg=254

hi Pmenu ctermbg=234 guifg=#1a1a1a ctermfg=white
hi VertSplit cterm=none gui=none

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

