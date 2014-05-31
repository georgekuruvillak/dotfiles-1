# FLVim
This is my own *vim* configuration. 


##Requirements
To work, flvim needs the followings available in your path:
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

## Installation
```bash
git clone https://github.com/majinbuu/flvim $HOME/.flvim && ln -s $HOME/.flvim/.vimrc $HOME/.vimrc

```
## Keys

### leader
The `<leader>` key is remapped to `,` 

### Autocompletion
To trigger autocompletion just hold down `tab`

### Motion Keys
`hjkl` - Arrows are disabled

### Tabs
`ctrl-t <direction>` - Move between tabs

### Splits
`ctrl-<direction>` - Move between splits

### Emmet
`<C-y>,` - Expand Abbreviation action

### Vim Related Test
`tt` - Open the related test (right now it only works with PHP, Java and Golang projects)

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

### Buffers
`<Leader>1` - Previous tab
`<Leader>2` - Next tab

### NERDCommenter
`<Leader>cc` - comment selected text
`<Leader>cu` -  un-comment selected text
See [documentation](https://github.com/scrooloose/nerdcommenter/blob/master/README.md)

### Other keys
`<C-y>,` - Expand Abbreviation action
`F4` - Highlight searched term
`F5` - Go to the next search occurence
`<C-t>` - Generate ctags

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

## Project vim settings
flvim enables exrc so if you place an `.exrc` or `.vimrc`  file in your project folder you override vim settings
for that folder.

**Warning**: exrc is enabled in secure mode, this will disable - system calls and write operations in all project specific configurations.     
