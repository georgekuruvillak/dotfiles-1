function! ctags#OnError()
    echo "❗ An error occurred generating ctags ❗"
endfunction

function! ctags#OnExit(st)
    echo "🎉 ctags generated 🎉"
endfunction

function! ctags#GenerateCtags() abort
    let opts = {
            \ 'on_stderr': function('ctags#OnError'),
            \ 'on_exit': function('ctags#OnExit')
            \ }
        return jobstart("ctags -R -f tags.tmp; awk 'length($0) < 400' tags.tmp > tags; rm tags.tmp", opts)
endfunction
