" BUNDLES

let shouldInstallPlugins = 0

" vundle setup {{{
if !filereadable($HOME . "/.vim/bundle/vundle/README.md")
echo "~≥ Installing Vundle \n"
silent !mkdir -p $HOME/.vim/bundle
silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
let shouldInstallPlugins = 1
endif
" }}}

filetype off
    set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdcommenter' 
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'joonty/vdebug.git'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-unimpaired'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'SyntaxRange'
Plugin 'hhvm/vim-hack'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'fatih/vim-go'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-dispatch'
Plugin 'fntlnz/notify.vim'
Plugin 'davidhalter/jedi'
Plugin 'majutsushi/tagbar'
Plugin 'groenewege/vim-less'

" Check if vundle bundles should be installed {{{
if shouldInstallPlugins == 1
    echo "~> Installing vundle bundles"
    :PluginInstall
endif
" }}}

