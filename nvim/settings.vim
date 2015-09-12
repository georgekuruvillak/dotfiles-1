" Generic settings

colorscheme molokai

" Initial indentation settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab

" Relative line number
set rnu

" Load project specific .nvimrc files
set exrc

" Show tabs and spaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
au FileType nerdtree set nolist

" PHP Sync method
let php_sync_method=-1
