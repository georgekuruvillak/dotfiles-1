" Plugins specific configurations

" Neomake
let g:neomake_php_phpcs_args_standard="PSR2"

" Multi Cursor
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" NERDTree
let NERDTreeShowHidden=1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Clang
let g:clang_c_completeopt = 'menuone,preview'
let g:clang_cpp_completeopt = 'menuone,preview'

" Neosnippet
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
