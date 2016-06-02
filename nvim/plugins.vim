let shouldInstallPluginManager = 0

" post installation hooks{{{
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer
    endif
endfunction
" }}}


if !filereadable($HOME . "/.config/nvim/autoload/plug.vim")
echo "~≥ Installing vim-plug \n"
silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let shouldInstallPluginManager = 1
endif

call plug#begin('~/.vim/plugged')

Plug 'benekastah/neomake', { 'on': 'Neomake' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'hhvm/vim-hack'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp']}
Plug 'fntlnz/atags.vim'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim', { 'for': ['html'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dracula/vim'
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'shime/vim-livedown', { 'for': 'markdown' }

call plug#end()

if shouldInstallPluginManager == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif

