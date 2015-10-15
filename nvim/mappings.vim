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
map ]gt :call atags#generate()<cr>

" FZF
map <Leader>f :FZF<cr>
map <Leader>t :Tags<cr>
map <Leader>b :Buffers<cr>

" NeoSnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
