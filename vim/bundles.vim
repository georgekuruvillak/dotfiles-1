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
Bundle  'scrooloose/syntastic'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter' 
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'Chiel92/vim-autoformat'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'Blackrush/vim-gocode'
Bundle 'dgryski/vim-godef'
Bundle 'bling/vim-airline'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'joonty/vdebug.git'
Bundle 'sjl/gundo.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'hhvm/vim-hack'
Bundle 'tpope/vim-fugitive'
Bundle 'dkprice/vim-easygrep'
Bundle 'terryma/vim-multiple-cursors'

" Check if vundle bundles should be installed {{{
if shouldInstallBundles == 1
    echo "~> Installing vundle bundles"
    :BundleInstall
endif
" }}}

