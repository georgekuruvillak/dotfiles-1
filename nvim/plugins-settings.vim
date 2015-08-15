" Neomake settings
let g:neomake_php_phpcs_args_standard="PSR2"

" YCM Settings
autocmd! User YouCompleteMe call youcompleteme#Enable()
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger=0
let g:ycm_error_symbol = "✗"
let g:ycm_warning_symbol = "∆"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_max_diagnostics_to_display = 1
