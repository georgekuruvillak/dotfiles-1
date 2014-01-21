" flvim is not compatible with vi
set nocompatible

" Check if git is available and if vundle is already installed  {{{
if executable("git") != 1 && !filereadable($HOME."/.vim/bundle/vundle/README.md")
    echo "GIT is required to configure flvim"

else    
    " vim plugin floder {{{
    call system("mkdir -p $HOME/.vim/plugin")
    " }}}

    " needed .vimrc.* files {{{
    let files = [
                \ ".vimrc.bundles",
                \ ".vimrc.fist",
                \ ".vimrc.last"]

    for file in files
        if !filereadable($HOME . "/" . file) | call system("touch " . $HOME . "/" . file) | endif
    endfor
    """ }}}
    let shouldInstallBundles = 0
    "vundle setup {{{
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

    if filereadable($HOME."/.vimrc.bundles")
        source $HOME/.vimrc.bundles
    endif 

    "Default bundles {{{
    Bundle 'molokai'
    " }}}

    "Check if bundles should be installed {{{
    if shouldInstallBundles == 1
        echo "~> Installing bundles"
        :BundleInstall
    endif
    " }}}

    " .vimrc.first is used for  prerequisites so it will be overwritten by anything below {{{
    if filereadable($HOME."/.vimrc.first")
        source $HOME/.vimrc.first
    endif
    " }}}

    "Default Configuration {{{
    
    filetype plugin indent on
    syntax on
    set smartindent                             "Smart autoindentation when starting a new line
    set shiftwidth=4                            "Number of spaces to use fo auto-indent 
    set tabstop=4                               "4 spaces for tab
    set expandtab                               "Spaces instead of tabs
    
    "Motion keys for tabs ctrl+t <direction>
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

    " .vimrc.last will overwrite anything above {{{
    if filereadable($HOME."/.vimrc.last")
        source $HOME/.vimrc.last
    endif
    " }}}

endif
" }}}
