" PHPMD
function! PHPMDFileReport()
    Dispatch! file=`mktemp`; phpmd % html codesize,unusedcode,naming ls > $file; google-chrome $file
endfunction

nmap ]md :call PHPMDFileReport()<CR>
imap ]md :call PHPMDFileReport()<CR><Esc>
vmap ]md :call PHPMDFileReport()<CR><Esc>
