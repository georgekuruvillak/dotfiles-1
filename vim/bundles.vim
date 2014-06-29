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

" Syntax checking plugin for Vim {{{
Bundle  'scrooloose/syntastic'
" }}}

" NERDCommenter {{{
Bundle 'scrooloose/nerdcommenter' 
" }}}

" Tagbar {{{
Bundle 'majutsushi/tagbar'
" }}}

" Emmet (Zen Coding)
Bundle 'mattn/emmet-vim'

" Auto formatter {
Bundle 'Chiel92/vim-autoformat'
" }

" NERDTree {{{
Bundle 'scrooloose/nerdtree'
" }}}

" YCM {{{
Bundle 'Valloric/YouCompleteMe'
" }}}

" phpcomplete.vim - PHP Autocompletion {{{
Bundle 'shawncplus/phpcomplete.vim'
" }}}

" php namespaces {{{
Bundle 'arnaud-lb/vim-php-namespace'
" }}}

" Finder for Vim {{{
Bundle 'kien/ctrlp.vim'
" }}}

" Vim Dispatch {{{
Bundle 'tpope/vim-dispatch'
" }}}

" Vim Gocode - Go Language Support {{{
Bundle 'Blackrush/vim-gocode'
" }}}

" Godef {{{
Bundle 'dgryski/vim-godef'
" }}}

" Vim Json - Vim Json Support {{{
Bundle 'elzr/vim-json' 
" }}}

" Airline  {{{
Bundle 'bling/vim-airline'
" }}}

" UltiSnips {{{
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
" }}}

" Vdebug {{{
Bundle 'joonty/vdebug.git'
" }}}

" Gundo {{{
Bundle 'sjl/gundo.vim'
" }}}

" Indentation Guides {{{
Bundle 'nathanaelkane/vim-indent-guides'
" }}}

" Hacklang support {{{
Bundle 'hhvm/vim-hack'
" }}}

" Javascript {{{
Bundle 'moll/vim-node'
Bundle 'marijnh/tern_for_vim'
Bundle 'pangloss/vim-javascript'
Bundle 'burnettk/vim-angular'
" }}}

" Easy Grep {{{
Bundle 'dkprice/vim-easygrep'
" }}}

" Check if vundle bundles should be installed {{{
if shouldInstallBundles == 1
    echo "~> Installing vundle bundles"
    :BundleInstall
endif
" }}}

