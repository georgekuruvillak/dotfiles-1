" Generic settings
syntax on
colorscheme dracula
set background=dark
set clipboard=unnamed
set termguicolors
set tabstop=2
set shiftwidth=2
set cmdheight=2
set expandtab
set autoindent
set smarttab
set modeline
set exrc
set hidden
set rnu
set nocompatible
set showmatch
"set so=999
"filetype plugin on
"filetype plugin indent on

" Show tabs and spaces
set listchars=tab:\•\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

" Highlight C useless trailing spaces in red
let c_space_errors = 1

" XML
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Automatic Format
"au BufWritePost * :Format

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()


" Statusline
set laststatus=2
set statusline=
set statusline+=%-10.3n\                         " buffer number
set statusline+=%F\                              " filename
set statusline+=%h%m%r%w                         " status flags
set statusline+=%y                               " file type
set statusline+=%=                               " right align remainder
set statusline+=0x%-8B                           " character value
set statusline+=%-14(%l,%c%V%)                   " line, character
set statusline+=%<%P                             " file position
set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
set statusline+=%{&ff}]                          " file format


" Color personalizations over default
"hi DiffChange    ctermbg=130 ctermfg=254
"hi DiffText      ctermbg=89 ctermfg=254
"hi DiffAdd       ctermbg=22 ctermfg=254
"hi DiffDelete    ctermbg=88 ctermfg=254
"hi MatchParen    ctermbg=none ctermfg=2
"hi Pmenu         ctermbg=235 ctermfg=white
"hi PmenuSel      ctermbg=233 ctermfg=white cterm=bold
"hi VertSplit     cterm=none
"hi Search        ctermbg=3 ctermfg=black

if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term SS08 12')
endif
