" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
    "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

let s:git_status_dictionary = {
            \ "A": "Added",
            \ "B": "Broken",
            \ "C": "Copied",
            \ "D": "Deleted",
            \ "M": "Modified",
            \ "R": "Renamed",
            \ "T": "Changed",
            \ "U": "Unmerged",
            \ "X": "Unknown"
            \ }

function! s:GetDiffFiles(rev)
  let list = map(split(system(
              \ 'git diff --name-status '.a:rev), '\n'),
              \ '{"filename":matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
              \ )
  call setqflist(list)
  copen
endfunction

command! -nargs=1 DiffRev call s:GetDiffFiles(<q-args>)

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
map ]z :ZoomToggle<CR>


" Go Test
if !exists("g:go_gotests_bin")
  let g:go_gotests_bin = "gotests"
endif

" Append output of gotests to corresponding _test.go file
function! s:GoTableTests(bang, ...)
  let func = search('^func ', "bcnW")
  if func == 0
    echo "no func found previous to cursor"
    return
  end
  let line = getline(func)
  let fname = split(split(line, " ")[1], "(")[0]
  " Check if binary exists
  let bin_path = go#path#CheckBinPath(g:go_gotests_bin)
  if empty(bin_path)
    return
  endif
  let file = expand('%')
  " Shouldn't happen as this function shouldn't be registered
  if empty(file)
    call go#util#EchoError("write go file to disk first")
    return
  endif
  " Ensure changes are written to disk for tool to read updated version
  if &modified
    call go#util#EchoError("unsaved changes in buffer")
    return
  endif
  " Run gotests
  let out = system(bin_path . ' -w -only ^' . shellescape(fname) . '$ ' . shellescape(file))
  if v:shell_error
    call go#util#EchoError("gotests error: " . out)
  endif
endfunction

command! -nargs=* GoTableTests call s:GoTableTests(0)
