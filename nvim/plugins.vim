let shouldInstallPluginManager = 0

" post installation hooks{{{
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.sh --clang-completer
    endif
endfunction
" }}}

if !filereadable($HOME . "/.nvim/autoload/plug.vim")
echo "~≥ Installing vim-plug \n"
silent !curl -fLo $HOME/.nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let shouldInstallPluginManager = 1
endif

call plug#begin('~/.vim/plugged')

Plug 'benekastah/neomake', { 'on': 'Neomake' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM'), 'for': ['c', 'cpp', 'php', 'go']}
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp']}
Plug 'fntlnz/atags.vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'

call plug#end()

if shouldInstallPluginManager == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif

