" flvim is not compatible with vi
set nocompatible

" Check if git is available and if vundle is already installed  {{{
if executable("git") != 1 && !filereadable($HOME."/.vim/bundle/vundle/README.md")
    echo "GIT is required to configure flvim:"

else    
    " needed .vimrc.* files {{{
    let files = [
                \ ".vimrc.vundles",
                \ ".vimrc.before",
                \ ".vimrc.after"]

    for file in files
        if !filereadable($HOME . "/" . file) | call system("touch " . $HOME . "/" . file) | endif
    endfor
    """ }}}
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

    if filereadable($HOME."/.vimrc.vundles")
        source $HOME/.vimrc.vundles
    endif 

    " Default vundles {{{

    " molokai color scheme
    Bundle 'molokai'

    " Syntax checking plugin for Vim {{{
    Bundle  'scrooloose/syntastic'
    " }}}

    " Emmet (Zen Coding)
    Bundle('mattn/emmet-vim')

    " Vim Related Test - Switch from source to tests {{{
    Bundle 'wdalmut/vim-relatedtest'
    " }}}

    " Finder for Vim {{{
    Bundle 'kien/ctrlp.vim'
    " }}}

    " Vim Fugitive - Git Wrapper {{{
    Bundle 'tpope/vim-fugitive'
    " }}}

    " Vim Golang - Go Language Support {{{
    Bundle 'jnwhiteh/vim-golang'
    " }}}

    " Vim Json - Vim Json Support {{{
    Bundle 'elzr/vim-json' 
    " }}}
    
    " SuperTab - Completions with Tab {{{
    Bundle 'ervandew/supertab'
    " }}}


    " Check if vundle bundles should be installed {{{
    if shouldInstallBundles == 1
        echo "~> Installing vundle bundles"
        :BundleInstall
    endif
    " }}}

    " .vimrc.before is used for  prerequisites so it will be overwritten by anything below {{{
    if filereadable($HOME . "/.vimrc.before")
        source $HOME/.vimrc.before
    endif
    " }}}

    " Default Configuration {{{

    filetype plugin indent on
    syntax on
    set smartindent                             " Smart autoindentation when starting a new line
    set shiftwidth=4                            " Number of spaces to use fo auto-indent 
    set tabstop=4                               " 4 spaces for tab
    set expandtab                               " Spaces instead of tabs
    set rnu                                     " Show relative line numbers
    set splitbelow                              " Split panels to bottom
    set splitright                              " Split panels to right

    " Synstastic Configuration {{{    
    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"
    let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
    let g:syntastic_javascript_checkers = ['jshint']
    " }}}

    " ctrl-p Configuration {{{
    let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](report|bin|cache|vendor|docs)$',
      \ }  
    " }}}

    " Enable OmniComplete {{{
    filetype plugin on
    set omnifunc=syntaxcomplete#Complete
    " }}}


    " SuperTab Configuration {{{
    let g:SuperTabDefaultCompletionType = "<C-X><C-O>" 
    " }}}

    " Motion keys for tabs ctrl+t <direction> {{{
    map <C-t><up> :tabr<cr>
    map <C-t><down> :tabl<cr>
    map <C-t><left> :tabp<cr>
    map <C-t><right> :tabn<cr>
    " }}}

    " Unmap Arrow Keys {{{
    no <down> <Nop>
    no <left> <Nop>
    no <right> <Nop>
    no <up> <Nop>
    ino <down> <Nop>
    ino <left> <Nop>
    ino <right> <Nop>
    ino <up> <Nop>
    vno <down> <Nop>
    vno <left> <Nop>
    vno <right> <Nop>
    vno <up> <Nop>
    " }}}

    " Exit insert mode {{{
    :inoremap jk <esc> 
    " }}}

    " Map Leader {{{
    let mapleader = "," 
    " }}} 

    " Color Scheme {{{
    colors molokai
    set background=dark
    let g:rehash256 = 1
    " }}}

    " Backspace Options {{{
    set backspace+=start,eol,indent
    " }}}

    " .vimrc.after will overwrite anything above {{{
    if filereadable($HOME."/.vimrc.after")
        source $HOME/.vimrc.after
    endif
    " }}}

    " Specific settings per Project {{{
    set exrc                                " Enable project specific .vimrc
    set secure                              " Enable secure mode
    " }}}

endif
" }}}
