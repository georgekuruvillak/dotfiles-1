" All Mappings

" Remap leader
let mapleader = ","

" Map è + to square brackets
nmap è [
nmap + ]
omap é [
omap + ]
xmap è [
xmap + ]

" NERDTree
map <Leader>n :NERDTreeToggle<cr>

" YCM Go to definition
nnoremap <Leader>jd :YcmCompleter GoTo <cr>

" Neomake cheker run
map ]n :Neomake<cr>

" Generate ctags
map ]gt :call ctags#GenerateCtags()<cr>
