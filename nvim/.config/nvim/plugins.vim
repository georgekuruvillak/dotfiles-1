let shouldInstallPluginManager = 0

if !filereadable($HOME . "/.local/share/nvim/site/autoload/plug.vim")
echo "~≥ Installing vim-plug \n"
silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let shouldInstallPluginManager = 1
endif

call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp']}
Plug 'fntlnz/atags.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'editorconfig/editorconfig-vim'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'Shougo/denite.nvim'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

call plug#end()

if shouldInstallPluginManager == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif
