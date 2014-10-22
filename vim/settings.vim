" SETTINGS

let g:user_name = system("git config user.name | head -n 1")
let g:user_email = system("git config user.email | head -n 1")

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
map <Leader>w :w<cr>                        " Fast save
map <Leader>1 :pclose<cr>                   " Close autocomplete preview

" Dealing with binary files and uglified JSON in Vim
" thanks to: http://0value.com/Dealing-with-binary-files-and-uglified-json-in-Vim
nnoremap <leader>jq :%!jq .<CR>
nnoremap <leader>JQ :%!jq . -c<CR>
nnoremap <leader>xxd :%!xxd<CR>
nnoremap <leader>XXD :%!xxd -r<CR>

" Synstastic Configuration    
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_enable_signs=1

" lopen & lclose mappingA
nnoremap <leader>lo :lopen <CR>
nnoremap <leader>lc :lclose <CR>

" ctrl-p Configuration
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/](report|bin|cache|vendor|docs)$',
            \ }  
nnoremap <Leader>. :CtrlPTag<cr>

" Copy and paste to/from system clipboard
map <leader>y "+y map <leader>p "+p  

" Splits movements ctrl+<direction>{{{ 
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR> 
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

" Toggle Tagbar
nmap <Leader>b :TagbarToggle<cr> 

" Open file under cursor
nmap <Leader>f <C-w>gf

" Go to definition
map <Leader>d :tab split<CR>:exec("tag ".expand("<cword>"))<CR> " -> in a tab
map <Leader>ds :vsp <CR>:exec("tag ".expand("<cword>"))<CR> " -> in a vertical split 

" NERDTree Configuration
autocmd VimEnter * nmap <F3> :NERDTreeToggle<CR>
autocmd VimEnter * imap <F3><F3> <Esc>:NERDTreeToggle<CR>a
let NERDTreeWinSize=35
let NERDTreeShowHidden=1
"let g:NERDTreeDirArrows=0

" Natural copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" hlsearch
nmap <F4> :set hls!<CR>:set hls?<CR>  

" Gundo
nnoremap <Leader>g :GundoToggle<CR>

" Color Scheme
set background=dark
colorscheme Tomorrow-Night
let g:rehash256 = 1

" Search and replace word under cursor
nnoremap sr :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i 

" Less: Workaround to make set filetype works
" https://github.com/groenewege/vim-less/issues/43
autocmd BufRead,BufNewFile *.less set filetype=less

" Airline 
set laststatus=2
set ttimeoutlen=50

" Specific settings per Project
set exrc                                " Enable project specific .vimrc
set secure                              " Enable secure mode
