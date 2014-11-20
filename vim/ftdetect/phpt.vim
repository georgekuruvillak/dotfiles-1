autocmd BufNewFile,BufRead *.phpt call SyntaxRange#Include('<?php', '?>', 'php')
