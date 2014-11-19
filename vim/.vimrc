set nocompatible " be iMproved

" Check if git is available and if vundle is already installed  {{{
if executable("git") != 1 && !filereadable($HOME."/.vim/bundle/vundle/README.md")
    echo "GIT is required to install bundles:"
else   
    source $HOME/.dotfiles/vim/bundles.vim
    source $HOME/.dotfiles/vim/settings.vim
    source $HOME/.dotfiles/vim/buffers.vim
    source $HOME/.dotfiles/vim/c.vim
endif
" }}}

