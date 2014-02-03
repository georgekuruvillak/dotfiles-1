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
    if !filereadable($HOME."/.vim/bundle/vundle/README.md")
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

    " NerdTree (explore your filesystem and to open files and directories.)
    Bundle  'scrooloose/nerdtree'
    " }}}
    
    " Syntax checking plugin for Vim {{{
    Bundle  'scrooloose/syntastic'
    " }}}
    
    " Emmet (Zen Coding)
    Bundle('mattn/emmet-vim')

    " Vim Related Test - Switch from source to tests {{{
    Bundle 'wdalmut/vim-relatedtest'
    " }}}
    
    " Vim Fugitive - Git Wrapper {{{
    Bundle 'tpope/vim-fugitive'
    " }}}
    
    " Vim Golang - Go Language Support {{{
    Bundle 'jnwhiteh/vim-golang'
    " }}}

    " AutoClose - Auto Brackets closing {{{
    Bundle 'vim-scripts/AutoClose'
    " }}}
    
    " Vim Json - Vim Json Support {{{
    Bundle 'elzr/vim-json' 
    " }}}

    " Check if vundle bundles should be installed {{{
    if shouldInstallBundles == 1
        echo "~> Installing vundle bundles"
        :BundleInstall
    endif
    " }}}

    " .vimrc.before is used for  prerequisites so it will be overwritten by anything below {{{
    if filereadable($HOME."/.vimrc.before")
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
    set nu                                      " Show line numbers
    set splitbelow                              " Split panels to bottom
    set splitright                              " Split panels to right

    " NERDTree Configuration {{{
    let NERDTreeQuitOnOpen=1                    " Automatically close NERDTree on file open
    autocmd VimEnter * nmap <F3> :NERDTreeToggle<cr>
    autocmd VimEnter * imap <F3><F3> <Esc>:NERDTreeToggle<CR>a
    let NERDTreeQuitOnOpen=1
    let NERDTreeWinSize=35
    " }}}

    " Synstastic Configuration {{{    
    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"
    let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
    let g:syntastic_javascript_checkers = ['jshint']
    " }}}

    " Motion keys for tabs ctrl+t <direction> {{{
    map <C-t><up> :tabr<cr>
    map <C-t><down> :tabl<cr>
    map <C-t><left> :tabp<cr>
    map <C-t><right> :tabn<cr>
    " }}}
    
    " Color Scheme {{{
    colors molokai
    set background=dark
    let g:rehash256 = 1
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
