" Generic settings
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smarttab
set modeline
set exrc
set hidden
set nu
set nocompatible
set showmatch
set so=999
filetype plugin on
filetype plugin indent on

hi SpellBad guibg=#ff2929 ctermbg=124

" Show tabs and spaces
set listchars=tab:\|\ ,trail:_,extends:>,precedes:<,nbsp:~
set list

" Highlight C useless trailing spaces in red
let c_space_errors = 1

" XML
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Automatic Neomake
au BufEnter,BufWritePost,InsertLeave * :Neomake

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" Personalized colors
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
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

hi ErrorMsg     guifg=black guifg=254 ctermfg=254
hi WarningMsg   guifg=black  ctermfg=254 gui=bold cterm=bold
hi ModeMsg      guifg=black gui=NONE ctermfg=254
hi MoreMsg      guifg=black gui=NONE ctermfg=254
hi Error        guifg=black  guifg=254 gui=underline ctermfg=254

hi Todo         guifg=black  ctermfg=254 ctermfg=254
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

highlight Normal ctermfg=254 ctermbg=black

hi SpecialKey guifg=#E8E2E3 gui=italic
hi Pmenu ctermbg=234 guifg=#1a1a1a ctermfg=white
hi VertSplit cterm=none gui=none
