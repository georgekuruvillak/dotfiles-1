set nocompatible " be iMproved

" Check if git is available and if vundle is already installed  {{{
if executable("git") != 1 && !filereadable($HOME."/.vim/bundle/vundle/README.md")
    echo "GIT is required to install bundles:"
else    
    " Bundles
    source $HOME/.dotfiles/vim/bundles.vim

    " Configuration
    filetype plugin indent on
    syntax on
    set autoindent                              " Enable autoindent
    set smartindent                             " Smart autoindentation when starting a new line
    set shiftwidth=4                            " Number of spaces to use fo auto-indent 
    set tabstop=4                               " 4 spaces for tab
    set rnu                                     " Show relative line numbers
    set cursorline                              " Enable Cursor line
    set modeline                                " Enable Modeline
    set backspace+=start,eol,indent             " Fix backspace
    set t_Co=256                                " 256 Colors
    set colorcolumn=80                          " Column on line 80
    let mapleader = ","                         " Remap leader
    set mouse=a                                 " Enable mouse
    imap jk <esc>                               " Esc with jk

    " Expandtab in go {{{
    if bufname("%") !~ '\.go$'
        set expandtab
    endif
    " }}}

    " Dealing with binary files and uglified JSON in Vim
    " thanks to: http://0value.com/Dealing-with-binary-files-and-uglified-json-in-Vim {{{
    nnoremap <leader>j :%!jq .<CR>
    nnoremap <leader>J :%!jq . -c<CR>
    nnoremap <leader>h :%!xxd<CR>
    nnoremap <leader>H :%!xxd -r<CR>
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

    " Copy and paste to/from system clipboard {{{
    map <leader>y "+y map <leader>p "+p " }}} 

    " Splits movements ctrl+<direction>{{{ 
    nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
    nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
    nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
    nmap <silent> <c-l> :wincmd l<CR> 
    set splitbelow
    set splitright
    " }}}

    " Unmap Arrow Keys {{{
    no <down> <Nop>
    no <left> <Nop>
    no <right> <Nop>
    no <up> <Nop>
    ino <left> <Nop>
    ino <right> <Nop>
    ino <up> <Nop>
    vno <down> <Nop>
    vno <left> <Nop>
    vno <right> <Nop>
    vno <up> <Nop>
    " }}}

    " Tab Indent and Shift Tab Reverse indent {{{
    vmap <Tab> >gv
    vmap <S-Tab> <gv
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
    nmap <C-t> :Start! ctags -R .<cr>
    " }}}


    " add /usr/include tags if is a c/cpp file {{{ 
    autocmd BufNewFile,BufRead *.c,*.cpp,*.h set tags+=/usr/include/tags
    " }}}

    " Generate ctags while editing {{{
    autocmd BufWritePost * if filereadable('tags') | call system('ctags -a '.expand('%')) | endif 
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
        set tags+=tags
    endif
    " }}} 

    " NERDTree Configuration {{{
    autocmd VimEnter * nmap <F3> :NERDTreeToggle<CR>
    autocmd VimEnter * imap <F3><F3> <Esc>:NERDTreeToggle<CR>a
    let NERDTreeWinSize=35
    let NERDTreeShowHidden=1
    " }}}

    " Tagbar Go {{{
    let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
        \ }
    " }}}

    " Natural copy and paste {{{
    vmap <C-c> "+yi
    vmap <C-x> "+c
    vmap <C-v> c<ESC>"+p
    imap <C-v> <C-r><C-o>+
    " }}}
    " hlsearch {{{
    nmap <F4> :set hls!<CR>:set hls?<CR>  
    " }}}


    " Buffers {{{
    " Autocomplete buffer name
    set wildchar=<Tab> wildmenu wildmode=full

    map <Leader>b1 :bprev<Return>
    map <Leader>b2 :bnext<Return>

    " Buffer name in status line 
    set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
    " }}}
    " }}}

    " YCM Options {{{
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_always_populate_location_list = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_auto_trigger = 1
    let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_global_ycm_extra_conf = '~/.dotfiles/vim/.ycm_extra_conf.py'
    " }}}

    " UltiSnips {{{
    let g:UltiSnipsExpandTrigger="<c-j>" 
    let g:snips_author="Lorenzo Fontana <fontanalorenzo@me.com>"
    " }}}

    " Gundo {{{
    nnoremap <Leader>g :GundoToggle<CR>
    " }}}

    " Autocomplete use PHP {{{
    inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
    noremap <Leader>u :call PhpInsertUse()<CR>
    " }}}

    " Color Scheme {{{
    set background=light
    colorscheme Tomorrow
    let g:rehash256 = 1
    " }}}
    

    " Smooth mouse scrolling {{{
    map <ScrollWheelUp> <C-Y>
    map <ScrollWheelDown> <C-E>
    " }}}


    if has("gui_running")
        if has("gui_gnome") 
            set guifont=Consolas\ 12
        endif
    endif 

    " Airline  {{{
    set laststatus=2
    set ttimeoutlen=50
    " }}}
   

    " Autocomplete improvements
    " from: http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE {{{
    set completeopt=longest,menuone
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 
    " }}}

    " Specific settings per Project {{{
    set exrc                                " Enable project specific .vimrc
    set secure                              " Enable secure mode
    " }}}

endif
" }}}

