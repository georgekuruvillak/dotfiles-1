" Plugins specific configurations

" Neomake
let g:neomake_php_phpcs_args_standard="PSR2"

" Multi Cursor
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" NERDTree
let NERDTreeShowHidden=1

" YCM
autocmd! User YouCompleteMe call youcompleteme#Enable()
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_max_diagnostics_to_display=1


let g:UltiSnipsExpandTrigger = "<C-j>"
