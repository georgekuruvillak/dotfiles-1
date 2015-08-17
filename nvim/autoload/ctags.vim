let g:ctags_had_errors=0
function! ctags#OnError(id, data)
    let g:ctags_had_errors=1
    let msg = "❗ An error occurred generating ctags: " . join(a:data)
    echo msg
endfunction

function! ctags#OnOut()
    if g:ctags_had_errors==0
        echo "🎉  ctags generated  🎉"
    endif
endfunction

function! ctags#GenerateCtags() abort
    let g:ctags_had_errors=0
    let opts = {
            \ 'on_stderr': function('ctags#OnError'),
            \ 'on_stdout': function('ctags#OnOut')
            \ }
        return jobstart("ctags -R -f tags.tmp; awk 'length($0) < 400' tags.tmp > tags; rm tags.tmp; echo 'ok'", opts)
endfunction
