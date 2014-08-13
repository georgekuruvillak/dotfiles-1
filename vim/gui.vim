" GUI OPTIONS

if has("gui_running")
    colorscheme Tomorrow
    set guifont=Monaco:h12
    set guitablabel=\[%N\]\ %t\ %M  
    nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
    nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
endif
