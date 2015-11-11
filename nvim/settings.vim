" Generic settings

colorscheme gruvbox
set background=dark

" Initial indentation settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set modeline
set exrc

" Relative line number
set rnu

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
