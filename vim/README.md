# .vimrc
This is my own *vim* configuration. 


##Requirements
To work, this needs the followings available in your path:
### Required
- GIT

### Optional

**Php**
- PHP 5.3+
- [PHP Codesniffer](https://github.com/squizlabs/PHP_CodeSniffer)
- [PHPMD](https://github.com/phpmd/phpmd)

**Javascript**
- Node
- [JSHint](http://www.jshint.com/install/)

**Go**
- Go
- [gofmt](http://golang.org/cmd/gofmt/)
- [golint](https://github.com/golang/lint)
- [gocode](https://github.com/nsf/gocode)

**Others**
- [jq](http://stedolan.github.io/jq/) - pretty print json
- [xxd](http://linuxcommand.org/man_pages/xxd1.html) - hexdump or reverse
## Keys

### leader
The `<leader>` key is remapped to `,` 

### Autocompletion
`ctrl+space` - trigger the completion

### Motion Keys
`hjkl` - Arrows are disabled

### Splits
`ctrl+<direction>` - Move between splits

### Emmet
`ctrl+y+,` - Expand Abbreviation action

### ctrl-p
See [documentation](https://github.com/kien/ctrlp.vim/blob/master/readme.md)

### Tagbar
`<Leader>b` - Open tagbar

### NERDTree
`F3` - Toggle NERDTree

### Gundo
`<Leader>g` - Show undo states

### Indentation guides
`<Leader>ig` - Toggle indentation guides

### NERDCommenter
`<Leader>cc` - comment selected text
`<Leader>cu` -  un-comment selected text
See [documentation](https://github.com/scrooloose/nerdcommenter/blob/master/README.md)

### Other keys
`<C-y>,` - Expand Abbreviation action
`F4` - Highlight searched term
`F5` - Go to the next search occurence
`<C-t>` - Generate ctags
`gq` - Format selected text
`<Leader>j`- Pretty print JSON (uppercase to revert)
`<Leader>h` - Pretty print binary file (uppercase to revert)

## Included Bundles
- [Tomorrow Theme](https://github.com/chriskempson/tomorrow-theme)
- [Synstastic](https://github.com/scrooloose/syntastic)
- [Emmet](https://github.com/mattn/emmet-vim)
- [vim-gocode](https://github.com/Blackrush/vim-gocode)
- [vim-godef](https://github.com/dgryski/vim-godef)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [tagbar](https://github.com/majutsushi/tagbar)
- [vim-json](https://github.com/elzr/vim-json)
- [NERDTree](https://github.com/scrooloose/nerdtree)
- [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
- [Airline](https://github.com/bling/vim-airline)
- [Gundo](https://github.com/sjl/gundo.vim)
- [vdebug](https://github.com/joonty/vdebug)
- [UltiSnips](https://github.com/SirVer/ultisnips) 
- [vim-autoformat](https://github.com/Chiel92/vim-autoformat)

## Project vim settings
This configuretion enables exrc so if you place an `.exrc` or `.vimrc`  file in your project folder you override vim settings
for that folder.

**Warning**: exrc is enabled in secure mode, this will disable - system calls and write operations in all project specific configurations.     
