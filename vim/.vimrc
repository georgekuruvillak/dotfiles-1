let shouldInstallPluginManager = 0

" post installation hooks{{{
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer
    endif
endfunction
" }}}

if !filereadable($HOME . "/.vim/autoload/plug.vim")
echo "~≥ Installing vim-plug \n"
silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let shouldInstallPluginManager = 1
endif
call plug#begin('~/.vim/plugged')

Plug 'benekastah/neomake', { 'on': 'Neomake' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'Valloric/MatchTagAlways', { 'for': [ 'html', 'xml' ] }
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
Plug 'shime/vim-livedown', { 'for': 'markdown' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'flazz/vim-colorschemes'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript']}
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'prettier/vim-prettier', {'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql']}

call plug#end()

if shouldInstallPluginManager == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif

" All Mappings {{{

" Remap leader
let mapleader = ","

" Map è + to square brackets
nmap è [
nmap + ]
omap é [
omap + ]
xmap è [
xmap + ]

imap jk <Esc>

" NERDTree
map <Leader>n :NERDTreeToggle<cr>

" Neomake cheker run
map ]n :Neomake<cr>

" Generate ctags
map ]gt :call atags#generate()<cr>

" FZF
map <Leader>f :FZF<cr>
map <Leader>t :Tags<cr>
map <Leader>b :Buffers<cr>

" Exit highlight mode
map <ESC><ESC> :nohl<cr>

" Buffers and tabs
map ]b :bn<cr>
map [b :bp<cr>
map gb :bn<cr>
map bd :bd<cr>

map ]t :tabnext<cr>
map [t :tabprevious<cr>

" Annotate
map ]a :Gblame<cr>

" Lnext/Lprev
map ]l :lnext<cr>
map [l :lprev<cr>

" Ctrl+Right click to preview the current tag
map <C><RightMouse> :pta <cword><cr>

" Term esc
:noremap <Esc> <C-\><C-n>
" }}}

" Plugins specific configurations {{{

" YCM
let g:ycm_server_python_interpreter = "python2"

" Multi Cursor
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" NERDTree
let NERDTreeShowHidden=1
if exists("NERDTreeAddKeyMap")
  call NERDTreeAddKeyMap({
          \ 'key': 'yy',
          \ 'callback': 'NERDTreeYankCurrentNode',
          \ 'quickhelpText': 'put full path of current node into the default register' })
endif

" Deoplete
let g:deoplete#enable_at_startup = 1

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" NERDTree git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" YCM
autocmd! User YouCompleteMe call youcompleteme#Enable()
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_max_diagnostics_to_display=1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:ycm_server_python_interpreter="/usr/bin/python"

" }}}
"
" Generic Settings {{{
set background=dark
colorscheme Tomorrow-Night-Bright

" Initial indentation settings
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smarttab
set modeline
set exrc
set hidden
set rnu
set showmatch
hi SpellBad guibg=#ff2929 ctermbg=124

" Show tabs and spaces
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
au FileType nerdtree set nolist

" PHP Sync method
let php_sync_method=-1

" Highlight C useless trailing spaces in red
let c_space_errors = 1

" XML
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Automatic Neomake
au BufEnter,BufWritePost,InsertLeave * :Neomake

" Hi current line
set cursorline
hi CursorLine ctermbg=0  "8 = dark gray, 15 = white
hi Cursor ctermbg=15 ctermfg=8

" }}}

