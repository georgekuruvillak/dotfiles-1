" Generic settings
syntax on

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
  set t_8b=^[[48;2;%lu;%lu;%lum
  set t_8f=^[[38;2;%lu;%lu;%lum
endif
set background=light
colorscheme one

set clipboard=unnamed
set shortmess+=c
syntax enable
set tabstop=2
set shiftwidth=2
set cmdheight=2
set expandtab
set autoindent
set smarttab
set modeline
set exrc
set hidden
set rnu
set nocompatible
set showmatch
set pumblend=24
set wildoptions=pum
set so=999
filetype plugin on
filetype plugin indent on

" Show tabs and spaces
set listchars=tab:\•\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

" Highlight C useless trailing spaces in red
let c_space_errors = 1

" XML
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Automatic Format
"au BufWritePost * :Format

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()


" Statusline
set laststatus=2
set statusline=
set statusline+=%-10.3n\                         " buffer number
set statusline+=%F\                              " filename
set statusline+=%h%m%r%w                         " status flags
set statusline+=%y                               " file type
set statusline+=%=                               " right align remainder
set statusline+=0x%-8B                           " character value
set statusline+=%-14(%l,%c%V%)                   " line, character
set statusline+=%<%P                             " file position
set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
set statusline+=%{&ff}]                          " file format

if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Iosevka Term SS08 12')
endif
