# FLVim
This is a super easy *vim* configuration. 


##Requirements
To work completely, flvim needs the followings available in your path:
### Required
- GIT

### Optional

**Php**
- PHP 5.3+
- [PHP Codesniffer](https://github.com/squizlabs/PHP_CodeSniffer)
- [PHPMD](https://github.com/phpmd/phpmd)
- [phpctags](https://github.com/vim-php/phpctags)

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
git clone https://github.com/fontanalorenzo/flvim
ln -s flvim/.vimrc $HOME/.vimrc
```
## Keys

### <leader>
The <leader> key is remapped to `,` 

### Autocompletion
To trigger autocompletion just hold down `tab`

### Motion Keys
```hjkl``` - Arrows are disabled
```jk``` - Exit insert mode

### Emmet
```<C-y>,``` - Expand Abbreviation action

### Vim Related Test
```tt``` - Open the related test (right now it only works with PHP, Java and Golang projects)

### ctrl-p
See [documentation](https://github.com/kien/ctrlp.vim/blob/master/readme.md)

### Tagbar
```,x``` - Open tagbar

### Other keys
```<C-y>,``` - Expand Abbreviation action

## Included Bundles
- Molokai
- [Synstastic](https://github.com/scrooloose/syntastic)
- [Emmet](https://github.com/mattn/emmet-vim)
- [vim-relatedtest](https://github.com/wdalmut/vim-relatedtest)
- [vim-gocode](https://github.com/Blackrush/vim-gocode)
- [ctrlp.vim](https://github.com/kien/ctrlp.vim)
- [tagbar](https://github.com/majutsushi/tagbar)
- [tagbar-phpctags](https://github.com/vim-php/tagbar-phpctags.vim)
- [vim-json](https://github.com/elzr/vim-json)
- [supertab](https://github.com/ervandew/supertab)
- [phpcomplete.vim](https://github.com/shawncplus/phpcomplete.vim)
- [clang_complete](https://github.com/Rip-Rip/clang_complete)

## Customization
FLVim provides 3 files to put into your own configuration.
- ```$HOME/.vimrc.after```    => Any configuration that will be overwritten by defaults and .vimrc.before
- ```$HOME/.vimrc.before```   => Configurations that will overwrite default configurations and .vimrc.after
- ```$HOME/.vimrc.vundles```  => Additiona Vundle Bundles to install 

## Per project vim settings
flvim enables exrc so if you place an ```.exrc``` or ```.vimrc```  file in your project folder you override vim settings
for that folder.

## .vimrc.after
Your `.vimrc.after` should configure the clang_library_path in order to work with clang_complete plugin

```
let g:clang_library_path='path/to/clang/library'
```


**Warning**: exrc is enabled in secure mode, this will disable - system calls and write operations in all project specific configurations.     
