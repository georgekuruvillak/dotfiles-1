" Plugins specific configurations

" Multi Cursor
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" NERDTree
let NERDTreeShowHidden=1
if exists("NERDTreeAddKeyMap")
  call NERDTreeAddKeyMap({
          \ 'key': 'yy',
          \ 'callback': 'NERDTreeYankCurrentNode',
          \ 'quickhelpText': 'put full path of current node into the default register' })
endif
au FileType nerdtree set nolist

" YCM
autocmd! User YouCompleteMe call youcompleteme#Enable()
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_max_diagnostics_to_display=1
let g:ycm_global_ycm_extra_conf = '~/.local/share/vim/site/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:ycm_server_python_interpreter="/usr/bin/python"

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

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

" vim-javascript
let g:javascript_plugin_jsdoc = 1


" atags default command
let g:atags_build_commands_list = ["ctags -o tags -R --c++-kinds=+p --fields=+iaS --sort=yes /usr/include `pwd`"]

" clang-format
autocmd FileType c,cpp,javascript,typescript,java ClangFormatAutoEnable


hi DiffAdd gui=NONE guifg=green guibg=black


