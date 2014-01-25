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
**Switch between tabs**

```<C-t><direction>``` - Move to the tab at the specified direction
### Emmet
```<C-y>,``` - Expand Abbreviation action

## Included Bundles
- Molokai
- [NerdTree](https://github.com/scrooloose/nerdtree)
- [Synstastic](https://github.com/scrooloose/syntastic)
- [Emmet](https://github.com/mattn/emmet-vim)

## Customization
FLVim provides 3 files to put into your own configuration.
- ```$HOME/.vimrc.after```    => Any configuration that will be overwritten by defaults and .vimrc.before
- ```$HOME/.vimrc.before```   => Configurations that will overwrite default configurations and .vimrc.after
- ```$HOME/.vimrc.vundles```  => Additiona Vundle Bundles to install 
