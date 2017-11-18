" Generic settings

syntax enable
set background=dark
colorscheme jellybeans

" Initial indentation settings
set clipboard=unnamed
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
set guicursor=""
hi SpellBad guibg=#ff2929 ctermbg=124

" Show tabs and spaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
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

