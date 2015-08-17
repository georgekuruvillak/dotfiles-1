" All Mappings

let mapleader = ","
map <Leader>n :NERDTreeToggle<cr>
nnoremap <Leader>jd :YcmCompleter GoTo <cr>
map +n :Neomake<cr>
map +gt :call ctags#GenerateCtags()<cr>
