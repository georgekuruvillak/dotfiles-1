" All Mappings

" Remap leader
let mapleader = ","

imap jk <Esc>

" NERDTree
map <Leader>n :NERDTreeToggle<cr>

" YCM Go to definition
nnoremap <Leader>jd :YcmCompleter GoTo <cr>

" Neomake cheker run
map ]n :Neomake<cr>

" Generate ctags
map ]gt :call atags#generate()<cr>

" FZF
map <Leader>f :FZF<cr>
map <Leader>t :Tags<cr>
map <Leader>b :Buffers<cr>

" Buffers and tabs
map ]b :bn<cr>
map [b :bp<cr>
map gb :bn<cr>
map bd :bd<cr>

map ]t :tabnext<cr>
map [t :tabprevious<cr>

" Annotate
map ]a :Gblame<cr>

" Lnext/Lprev
map ]l :lnext<cr>
map [l :lprev<cr>

" Term esc
:tnoremap <Esc> <C-\><C-n>

" Review the current branch to master
map ]r :DiffRev master<cr>

" Open tagbar
nmap <Leader>t :TagbarToggle<CR>
