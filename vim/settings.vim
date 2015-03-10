" SETTINGS

filetype plugin indent on
syntax on
set autoindent                              " Enable autoindent
set smartindent                             " Smart autoindentation when starting a new line
set shiftwidth=4                            " Number of spaces to use fo auto-indent 
set tabstop=4                               " 4 spaces for tab
set expandtab                               " Expand tab
set nu                                      " Show line numbers
set cursorline                              " Enable Cursor line
set modeline                                " Enable Modeline
set backspace+=start,eol,indent             " Fix backspace
set t_Co=256                                " 256 Colors
call matchadd('ColorColumn', '\%81v', 100)  " Color the 81th column
let mapleader = ","                         " Remap leader
map <Leader>1 :pclose<cr>                   " Close autocomplete preview
set pastetoggle=<F12>                       " paste toggle
colorscheme hybrid
set ttyfast
set lazyredraw

" Map esc key
inoremap jk <Esc>

" Save with and generate ctags with shift+k
nmap <S-k> :call GenerateCtags()<CR>:w<CR>
imap <S-k> :call GenerateCtags()<CR><Esc>:w<CR>
vmap <S-k> :call GenerateCtags()<CR><Esc>:w<CR>

" Just save with ctrl+k
nmap <C-k> :w<CR>
imap <C-k> <Esc>:w<CR>
vmap <C-k> <Esc>:w<CR>

" Dealing with binary files and uglified JSON in Vim
" thanks to: http://0value.com/Dealing-with-binary-files-and-uglified-json-in-Vim
nnoremap <leader>jq :%!jq .<CR>
nnoremap <leader>JQ :%!jq . -c<CR>
nnoremap <leader>xxd :%!xxd<CR>
nnoremap <leader>XXD :%!xxd -r<CR>

" transform a json object into a php array
noremap <silent> <Leader>J /{\_[^}{]*}<CR>mo%mpv`o:s/"\s*:\s*"/" => "/g<CR>`o%mpr]`or[`ov`p:s/",[^\n$]/",\r/g<CR>mp`o:s/"/\r"/<CR>`ov`p=:nohl<CR>

" Map è + to square brackets
nmap è [
nmap + ]
omap é [
omap + ]
xmap è [
xmap + ]

" ctrl-p Configuration
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](report|bin|cache|vendor|docs)$',
            \ }

set splitbelow
set splitright

" Unmap Arrow Keys
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

" Tab Indent and Shift Tab Reverse indent
vmap <Tab> >gv
vmap <S-Tab> <gv

" hlsearch
nmap <F4> :set hls!<CR>:set hls?<CR>  


" Search and replace word under cursor
nnoremap sr :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i 

" Airline 
set laststatus=2
set ttimeoutlen=50

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:snips_author = "Lorenzo Fontana  <fontanalorenzo@me.com>"

" NERDTree
map <Leader>n :NERDTreeToggle<CR>

" {{{ YCM
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = "✗"
let g:ycm_warning_symbol = "∆"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <Leader>jd :YcmCompleter GoTo <cr>
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" }}}

" Visualize tabs and trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Syntastic
let g:syntastic_php_checkers = ["php", "phpcs", "phpmd"]
let g:syntastic_javascript_checkers = ["jshint", "flow"]
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_cursor_column = 0

" Vim php namespace
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

" Automatic Ctags Generation
function! GenerateCtags()
    if exists("g:automatic_tags") && g:automatic_tags == 1
        Dispatch! ctags -R && find . -regex ".*\.\(php\|c\|js\|cpp\|h\)" > ./cscope.files && cscope -ub -i cscope.files && vim +Notify\ "Horray"\ "Ctags\ updated" +qall
    else
        echom "ctags not generated, please set g:automatic_tags = 1 to do so"
    endif
endfunction

" Cscope
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
endif

" EasyMotion
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Do not indent c++ ns
set cino=N-s

" Specific settings per Project
set exrc                                " Enable project specific .vimrc
set secure                              " Enable secure mode
