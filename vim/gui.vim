" GUI OPTIONS

if has("gui_running")
    set guifont=Consolas\ 10
    set guitablabel=\[%N\]\ %t\ %M  
    nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
    nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
endif
