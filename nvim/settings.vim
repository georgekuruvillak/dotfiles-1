" Generic settings

colorscheme Tomorrow-Night-Eighties

" Initial indentation settings
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smarttab
set modeline
set exrc
set hidden
set rnu
set showmatch

" Show tabs and spaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
au FileType nerdtree set nolist

" PHP Sync method
let php_sync_method=-1

" Highlight C useless trailing spaces in red
let c_space_errors = 1

" XML
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Automatic Neomake
au BufEnter,BufWritePost,InsertLeave * :Neomake

" Hi current line
set cursorline
hi CursorLine ctermbg=0  "8 = dark gray, 15 = white
hi Cursor ctermbg=15 ctermfg=8

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

