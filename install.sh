#!/usr/bin/env bash

if [ "$1" != "--force" ]
    then
    if [ -e "${HOME}/.dotfiles" ]
    then
        echo "~> A .dotfiles folder already found in ${HOME}. To overwrite it execute this command with the --force option"
        exit
    fi
fi

rm -Rf $HOME/.dotfiles
git clone https://github.com/fntlnz/dotfiles $HOME/.dotfiles
ln -s $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
