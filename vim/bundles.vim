" BUNDLES

let shouldInstallBundles = 0

" vundle setup {{{
if !filereadable($HOME . "/.vim/bundle/vundle/README.md")
echo "~≥ Installing Vundle \n"
silent !mkdir -p $HOME/.vim/bundle
silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
let shouldInstallBundles = 1
endif
" }}}

filetype off
    set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter' 
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'joonty/vdebug.git'
Bundle 'tpope/vim-fugitive'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-unimpaired'
Bundle 'mileszs/ack.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'flazz/vim-colorschemes'
Bundle 'SyntaxRange'
Bundle 'hhvm/vim-hack'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'fatih/vim-go'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-dispatch'
Bundle 'fntlnz/notify.vim'
Bundle 'davidhalter/jedi'
Bundle 'brookhong/cscope.vim'

" Check if vundle bundles should be installed {{{
if shouldInstallBundles == 1
    echo "~> Installing vundle bundles"
    :BundleInstall
endif
" }}}

