" Plugins specific configurations

" Multi Cursor
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" atags default command
let g:atags_build_commands_list = ["ctags -o tags -R --c++-kinds=+p --fields=+iaS --sort=yes /usr/include `pwd`"]

" clang-format
autocmd FileType c,cpp,javascript,typescript,java ClangFormatAutoEnable

let g:tagbar_autofocus = 1

" Vim one colors
call one#highlight('Normal', 'abb2bf', '000000', 'none')

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" NERDTree
let g:NERDTreeShowHidden=1
if exists("NERDTreeAddKeyMap")
  call NERDTreeAddKeyMap({
          \ 'key': 'yy',
          \ 'callback': 'NERDTreeYankCurrentNode',
          \ 'quickhelpText': 'put full path of current node into the default register' })
endif
au FileType nerdtree set nolist

" NERDTree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeHighlightCursorline=0

