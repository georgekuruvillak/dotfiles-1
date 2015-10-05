#!/usr/bin/env bash

if [ -e "${HOME}/.dotfiles" ]; then
    echo "~> .dotfiles folder already found in ${HOME}."
    exit
fi

# GIT
git config --global core.excludesfile ~/.gitignore_global
git config --global branch.autosetuprebase always
git config --global alias.pre "pull --rebase"
git config --global alias.st status
git config --global alias.cf '!nvim -p `git diff --name-only`'

# Dotfiles
rm -Rf $HOME/.dotfiles
git clone https://github.com/fntlnz/dotfiles $HOME/.dotfiles
ln -sf $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/git/.gitignore_global $HOME/.gitignore_global
ln -sf $HOME/.dotfiles/gdb/.gdbinit $HOME/.gdbinit
ln -sf $HOME/.dotfiles/ctags/.ctags $HOME/.ctags
ln -sf $HOME/.dotfiles/nvim/.nvimrc $HOME/.nvimrc
mkdir -p $HOME/.nvim/autoload
ln -sf $HOME/.dotfiles/nvim/autoload/* $HOME/.nvim/autoload
mkdir -p $HOME/.nvim/ftplugin
ln -sf $HOME/.dotfiles/nvim/ftplugin/* $HOME/.nvim/ftplugin

# ZSH
touch $HOME/.zshrc_local
