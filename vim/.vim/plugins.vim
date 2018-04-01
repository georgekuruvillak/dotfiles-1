let shouldInstallPluginManager = 0

" post installation hooks{{{
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --system-libclang --clang-completer --go-completer --rust-completer --js-completer --java-completer
    endif
endfunction
" }}}


if !filereadable($HOME . "/.vim/autoload/plug.vim")
echo "~≥ Installing vim-plug \n"
silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let shouldInstallPluginManager = 1
endif

call plug#begin('~/.local/share/vim/site/plugged')

Plug 'benekastah/neomake', { 'on': 'Neomake' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'fatih/vim-go', { 'for': 'go' } 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp']}
Plug 'fntlnz/atags.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mattn/emmet-vim', { 'for': ['html'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
"Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'rhysd/vim-clang-format'
Plug 'Yggdroot/indentLine'
Plug 'dhruvasagar/vim-table-mode'
Plug 'cocopon/iceberg.vim'
Plug 'airblade/vim-gitgutter'

call plug#end()

if shouldInstallPluginManager == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif