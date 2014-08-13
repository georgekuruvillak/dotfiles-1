" PHP RELATED SETTINGS

if bufname("%") !~ '\.php$'
    inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
    noremap <Leader>u :call PhpInsertUse()<CR>
    let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"
    let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

    let g:tagbar_type_php = {
                    \ 'kinds'     : [
                        \ 'd:Constants:0:0',
                        \ 'v:Variables:0:0',
                        \ 'f:Functions:1',
                        \ 'i:Interfaces:0',
                        \ 'c:Classes:0',
                        \ 'p:Properties:0:0',
                        \ 'm:Methods:1',
                        \ 'n:Namespaces:0',
                        \ 't:Traits:0',
                    \ ],
                    \ 'sro'        : '::',
                    \ 'kind2scope' : {
                        \ 'c' : 'class',
                        \ 'm' : 'method',
                        \ 'f' : 'function',
                        \ 'i' : 'interface',
                        \ 'n' : 'namespace',
                        \ 't' : 'trait',
                    \ },
                    \ 'scope2kind' : {
                        \ 'class'     : 'c',
                        \ 'method'    : 'm',
                        \ 'function'  : 'f',
                        \ 'interface' : 'i',
                        \ 'namespace' : 'n',
                        \ 'trait'     : 't',
                    \ }
                \ }

endif

" PHP EXTENSION DEVELOPMENT RELATED SETTINGS

" PHP Syntax highlighting in phpt files (wondering if it can be done with a
" regex like /--EXPECT(F)?--/
autocmd BufNewFile,BufRead *.phpt call SyntaxRange#Include('--FILE--', '--EXPECT--', 'php')
