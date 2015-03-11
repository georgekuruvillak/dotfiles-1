let g:syntastic_php_checkers = ["php", "phpcs"]
let g:syntastic_php_phpcs_args="--standard=PSR2 -n --report=csv"

" PHPMD
function! PHPMDFileReport()
    Dispatch! file=`mktemp`; phpmd % html codesize,unusedcode,naming ls > $file; google-chrome $file
endfunction

" Save with and generate ctags with shift+k
nmap <S-m> :call PHPMDFileReport()<CR>
imap <S-m> :call PHPMDFileReport()<CR><Esc>
vmap <S-m> :call PHPMDFileReport()<CR><Esc>
