" AUTOCOMPLETE OPTIONS

if filereadable("tags")
    set tags+=tags
endif

" Generate ctags
nmap <C-t> :Start! ctags -R .<cr>

" add /usr/include tags if is a c/cpp file
autocmd BufNewFile,BufRead *.c,*.cpp,*.h set tags+=/usr/include/tags

" Generate ctags while editing
autocmd BufWritePost * if filereadable('tags') | call system('ctags -a '.expand('%')) | endif 

" Autocomplete ctrl-space
imap <C-Space> <C-x><C-o>

" YCM settings
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/vim/.ycm_extra_conf.py'

" Autocomplete improvements from: http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>" 

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>" 
let g:snips_author="Lorenzo Fontana <fontanalorenzo@me.com>"

