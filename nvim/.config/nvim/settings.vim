" Generic settings
colorscheme one
set clipboard=unnamed
set termguicolors
set background=dark
set tabstop=2
set shiftwidth=2
set cmdheight=2
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

" Show tabs and spaces
set listchars=tab:\¦\ ,trail:_,extends:>,precedes:<,nbsp:~
set list

" Highlight C useless trailing spaces in red
let c_space_errors = 1

" XML
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" "Automatic Neomake
"au BufEnter,BufWritePost,InsertLeave * :Neomake

" Automatic Format
au BufWritePost * :Format

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

