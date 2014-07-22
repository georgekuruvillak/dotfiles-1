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
    map <Leader>w :w                            " Fast save
    " Expandtab in go {{{
    if bufname("%") !~ '\.go$'
        set expandtab
    endif
    " }}}

    " Dealing with binary files and uglified JSON in Vim
    " thanks to: http://0value.com/Dealing-with-binary-files-and-uglified-json-in-Vim {{{
    nnoremap <leader>jq :%!jq .<CR>
    nnoremap <leader>JQ :%!jq . -c<CR>
    nnoremap <leader>xxd :%!xxd<CR>
    nnoremap <leader>XXD :%!xxd -r<CR>
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

    " Make views automatic {{{
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview 
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


    " ctrl click jump to definition in tab {{{
    nnoremap <C-LeftMouse> <C-w><C-]><C-w>T
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
    imap <C-Space> <C-x><C-o>
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


    " Easier buffer switching 
    " Source http://vim.wikia.com/wiki/Easier_buffer_switching
    function! BufSel(pattern)
        let bufcount = bufnr("$")
        let currbufnr = 1
        let nummatches = 0
        let firstmatchingbufnr = 0
        while currbufnr <= bufcount
            if(bufexists(currbufnr))
                let currbufname = bufname(currbufnr)
                if(match(currbufname, a:pattern) > -1)
                    echo currbufnr . ": ". bufname(currbufnr)
                    let nummatches += 1
                    let firstmatchingbufnr = currbufnr
                endif
            endif
            let currbufnr = currbufnr + 1
        endwhile
        if(nummatches == 1)
            execute ":buffer ". firstmatchingbufnr
        elseif(nummatches > 1)
            let desiredbufnr = input("Enter buffer number: ")
            if(strlen(desiredbufnr) != 0)
                execute ":buffer ". desiredbufnr
            endif
        else
            echo "No matching buffers"
        endif
    endfunction
    command! -nargs=1 Bs :call BufSel("<args>")
    " Choose buffer and select
    nnoremap bs :buffers<CR>:buffer<Space>

    " Buffer deletion
    function! BufDel(pattern)
        let bufcount = bufnr("$")
        let currbufnr = 1
        let nummatches = 0
        let firstmatchingbufnr = 0
        while currbufnr <= bufcount
            if(bufexists(currbufnr))
                let currbufname = bufname(currbufnr)
                if(match(currbufname, a:pattern) > -1)
                    echo currbufnr . ": ". bufname(currbufnr)
                    let nummatches += 1
                    let firstmatchingbufnr = currbufnr
                endif
            endif
            let currbufnr = currbufnr + 1
        endwhile
        if(nummatches == 1)
            execute ":bdelete ". firstmatchingbufnr
        elseif(nummatches > 1)
            let desiredbufnr = input("Enter buffer number: ")
            if(strlen(desiredbufnr) != 0)
                execute ":bdelete ". desiredbufnr
            endif
        else
            echo "No matching buffers"
        endif
    endfunction
    command! -nargs=1 Bd :call BufDel("<args>") 
    " Choose buffer and delete
    nnoremap bd :buffers<CR>:bdelete<Space>


    " Delete current buffer
    nnoremap bq :bd<CR>

    " Buffer name in status line 
    set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

    " Autocomplete Options {{{
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

    " Autocomplete improvements from: http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
    set completeopt=longest,menuone
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 

    " Autocomplete use PHP
    inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
    noremap <Leader>u :call PhpInsertUse()<CR>

    " }}}

    " UltiSnips {{{
    let g:UltiSnipsExpandTrigger="<c-j>" 
    let g:snips_author="Lorenzo Fontana <fontanalorenzo@me.com>"
    " }}}

    " Gundo {{{
    nnoremap <Leader>g :GundoToggle<CR>
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

    " Search and replace word under cursor {{{
    nnoremap sr :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i 
    " }}}


    " GUI Options {{{
    if has("gui_running")
        set guifont=Consolas\ 10
        set guitablabel=\[%N\]\ %t\ %M  
        nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
        nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
    endif
    " }}}

    " Airline  {{{
    set laststatus=2
    set ttimeoutlen=50
    " }}}

    " Automatic folding {{{
    set foldmethod=syntax
    set foldlevelstart=1
    let javaScript_fold=1         " JavaScript
    let perl_fold=1               " Perl
    let php_folding=1             " PHP
    let r_syntax_folding=1        " R
    let ruby_fold=1               " Ruby
    let sh_fold_enabled=1         " sh
    let vimsyn_folding='af'       " Vim script
    let xml_syntax_folding=1      " XML
    " }}}

    " Specific settings per Project {{{
    set exrc                                " Enable project specific .vimrc
    set secure                              " Enable secure mode
    " }}}

endif
" }}}

