#!/usr/bin/env bash

if [ "$1" != "--force" ]; then
    if [ -e "${HOME}/.dotfiles" ]; then
        echo "~> A .dotfiles folder already found in ${HOME}. To overwrite it execute this command with the --force option"
        exit
    fi
fi

# GIT
git config --global core.excludesfile ~/.gitignore_global
git config --global branch.autosetuprebase always

# Dotfiles
rm -Rf $HOME/.dotfiles
git clone https://github.com/fntlnz/dotfiles $HOME/.dotfiles
ln -s $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/scripts/* /usr/local/bin
ln -s $HOME/.dotfiles/git/.gitignore_global $HOME/.gitignore_global
ln -s $HOME/.dotfiles/gdb/.gdbinit $HOME/.gdbinit
ln -s $HOME/.dotfiles/ctags/.ctags $HOME/.ctags
ln -s $HOME/.dotfiles/vim/ftdetect/* $HOME/.vim/ftdetect

# Gnome Terminal Colorscheme
git clone git://github.com/pricco/gnome-terminal-colors-monokai.git /tmp/gnome-terminal-colors-monokai 
cd /tmp/gnome-terminal-colors-monokai && ./install.sh

# ZSH
touch $HOME/.zshrc_local
