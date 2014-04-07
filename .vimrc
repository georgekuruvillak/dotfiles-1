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
    " }}}

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

    " Tomorrow Theme {{{
    Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
    " }}}

    " Syntax checking plugin for Vim {{{
    Bundle  'scrooloose/syntastic'
    " }}}

    " Tagbar {{{
    Bundle 'majutsushi/tagbar'
    " }}}

    " Emmet (Zen Coding)
    Bundle('mattn/emmet-vim')

    " Vim Related Test - Switch from source to tests {{{
    Bundle 'wdalmut/vim-relatedtest'
    " }}}

    " NERDTree {{{
    Bundle 'scrooloose/nerdtree'
    " }}}

    " phpcomplete.vim - PHP Autocompletion {{{
    Bundle 'shawncplus/phpcomplete.vim'
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

    " Vim Json - Vim Json Support {{{
    Bundle 'elzr/vim-json' 
    " }}}

    " Airline  {{{
    Bundle 'bling/vim-airline'
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
    set rnu                                     " Show relative line numbers
    set splitbelow                              " Split panels to bottom
    set splitright                              " Split panels to right

    " Expandtab {{{
    if bufname("%") !~ '\.go$'
        set expandtab
    endif
    " }}}

    " Map Leader {{{
    let mapleader = "," 
    " }}} 

    " 256 Colors {{{ 
    set t_Co=256
    " }}}

    " Synstastic Configuration {{{    
    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"
    let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_go_checkers = ['go', 'gofmt', 'golint'] 
    " }}}

    " ctrl-p Configuration {{{
    let g:ctrlp_custom_ignore = {
                \ 'dir': '\v[\/](report|bin|cache|vendor|docs)$',
                \ }  
    " }}}

    " OmniComplete {{{
    filetype plugin on
    set omnifunc=syntaxcomplete#Complete
    " }}}

    " Motion keys for tabs ctrl+t <direction> {{{
    map <C-t><up> :tabr<cr>
    map <C-t><down> :tabl<cr>
    map <C-t><left> :tabp<cr>
    map <C-t><right> :tabn<cr>
    " }}}

    " Select all {{{
    map <C-a> ggVG
    " }}}

    " Open tab {{{
    map <C-t> :tabnew<cr> 
    " }}}

    " Splits movements ctrl+<direction>{{{ 
    nnoremap <C-down> <C-W><C-J>
    nnoremap <C-up> <C-W><C-K>
    nnoremap <C-right> <C-W><C-L>
    nnoremap <C-left> <C-W><C-H>
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
    set splitbelow
    set splitright
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

    " Toggle Tagbar {{{
    nmap <Leader>b :TagbarToggle<cr> 
    " }}}

    " CtrlPTag {{{
    nnoremap <Leader>. :CtrlPTag<cr>
    " }}}

    " Open file under cursor {{{
    nmap <Leader>f <C-w>gf
    " }}}

    " Generate ctags {{{
    nmap <Leader>c :Start! ctags -R .<cr>
    " }}}

    " add /usr/include tags if is a c/cpp file {{{ 
    autocmd BufNewFile,BufRead *.c,*.cpp,*.h set tags+=/usr/include/tags
    " }}}

    " Generate ctags while editing {{{
    autocmd BufWritePost * if filereadable('tags') | call system('ctags -a '.expand('%')) | endif 
    " }}}

    " Open file under cursor in a new tab {{{
    nmap gf <c-w>f
    " }}}

    " Autocomplete ctrl-space {{{
    inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
                \ "\<lt>C-n>" :
                \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
                \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
                \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
    imap <C-@> <C-Space>
    " }}}


    " Go to definition {{{
    map <Leader>d :tab split<CR>:exec("tag ".expand("<cword>"))<CR> " -> in a tab
    map <Leader>ds :vsp <CR>:exec("tag ".expand("<cword>"))<CR> " -> in a vertical split 

    " }}}


    " Read an existing tags file {{{
    if filereadable("tags")
        set tags=tags
    endif
    " }}} 

    " NERDTree Configuration {{{
    let NERDTreeQuitOnOpen=1                    " Automatically close NERDTree on file open
    autocmd VimEnter * nmap <F3> :NERDTreeToggle<CR>
    autocmd VimEnter * imap <F3><F3> <Esc>:NERDTreeToggle<CR>a
    let NERDTreeQuitOnOpen=1
    let NERDTreeWinSize=35
    " }}}


    " Color Scheme {{{
    color Tomorrow-Night
    set background=dark
    let g:rehash256 = 1
    " }}}

    " Airline  {{{
    set laststatus=2
    set ttimeoutlen=50
    " }}}

    " Enable cursor line {{{
    set cursorline 
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

