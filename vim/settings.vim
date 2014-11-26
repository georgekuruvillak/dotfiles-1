" SETTINGS

filetype plugin indent on
syntax on
set autoindent                              " Enable autoindent
set smartindent                             " Smart autoindentation when starting a new line
set shiftwidth=4                            " Number of spaces to use fo auto-indent 
set tabstop=4                               " 4 spaces for tab
set expandtab								" Expand tab
set nu                                      " Show line numbers
set cursorline                              " Enable Cursor line
set modeline                                " Enable Modeline
set backspace+=start,eol,indent             " Fix backspace
set t_Co=256                                " 256 Colors
set colorcolumn=80                          " Column on line 80
let mapleader = ","                         " Remap leader
set mouse=a                                 " Enable mouse
map <Leader>1 :pclose<cr>                   " Close autocomplete preview
set pastetoggle=<F12>                       " paste toggle
colorscheme molokai

" Map esc key
inoremap jk <Esc>
" Dealing with binary files and uglified JSON in Vim
" thanks to: http://0value.com/Dealing-with-binary-files-and-uglified-json-in-Vim
nnoremap <leader>jq :%!jq .<CR>
nnoremap <leader>JQ :%!jq . -c<CR>
nnoremap <leader>xxd :%!xxd<CR>
nnoremap <leader>XXD :%!xxd -r<CR>

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
nnoremap <Leader>. :CtrlPTag<cr>

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
map jn :NERDTreeToggle<CR>

" Specific settings per Project
set exrc                                " Enable project specific .vimrc
set secure                              " Enable secure mode
