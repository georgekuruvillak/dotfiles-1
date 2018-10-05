" Generic settings
set background=dark
let base16colorspace=256
colorscheme base16-phd
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

" Automatic Format
au BufWritePost * :Format

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
