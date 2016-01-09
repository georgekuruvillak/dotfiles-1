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
mkdir -p $HOME/.config/nvim
git clone https://github.com/fntlnz/dotfiles $HOME/.dotfiles

ln -sf $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/git/.gitignore_global $HOME/.gitignore_global
ln -sf $HOME/.dotfiles/gdb/.gdbinit $HOME/.gdbinit
ln -sf $HOME/.dotfiles/ctags/.ctags $HOME/.ctags

ln -sf $HOME/.dotfiles/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $HOME/.dotfiles/nvim/ftplugin $HOME/.config/nvim/ftplugin

ln -sf $HOME/.dotfiles/dunst $HOME/.config/dunst

# ZSH
touch $HOME/.zshrc_local
