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

**Javascript**
- Node
- [JSHint](http://www.jshint.com/install/)

## Installation
```bash
git clone https://github.com/fontanalorenzo/flvim
ln -s flvim/.vimrc $HOME/.vimrc
```
## Keys
### Motion Keys
```<C-t><direction>``` - Move to the tab at the specified direction

### Emmet
```<C-y>,``` - Expand Abbreviation action

### Vim Related Test
```tt``` - Open the related test (right now it only works with PHP and Golang files)

## Included Bundles
- Molokai
- [NerdTree](https://github.com/scrooloose/nerdtree)
- [Synstastic](https://github.com/scrooloose/syntastic)
- [Emmet](https://github.com/mattn/emmet-vim)
- [vim-relatedtest](https://github.com/wdalmut/vim-relatedtest)

## Customization
FLVim provides 3 files to put into your own configuration.
- ```$HOME/.vimrc.after```    => Any configuration that will be overwritten by defaults and .vimrc.before
- ```$HOME/.vimrc.before```   => Configurations that will overwrite default configurations and .vimrc.after
- ```$HOME/.vimrc.vundles```  => Additiona Vundle Bundles to install 

## Per project vim settings
flvim enables exrc so if you place an ```.exrc``` or ```.vimrc```  file in your project folder you override vim settings
for that folder.

**Warning**: exrc is enabled in secure mode, this will disable system calls and write operations in all project specific configurations.     
