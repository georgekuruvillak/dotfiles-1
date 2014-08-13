#!/usr/bin/env bash

if [ "$1" != "--force" ]; then
    if [ -e "${HOME}/.dotfiles" ]; then
        echo "~> A .dotfiles folder already found in ${HOME}. To overwrite it execute this command with the --force option"
        exit
    fi
fi

echo "Type your full name followed by enter:"
read name

echo "Type your email address followed by enter:"
read email

# Configuring git
git config --global user.name $name
git config --global user.email $email
git config --global core.excludesfile ~/.gitignore_global
git config --global branch.autosetuprebase always

rm -Rf $HOME/.dotfiles
git clone https://github.com/fntlnz/dotfiles $HOME/.dotfiles
ln -s $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/scripts/* /usr/local/bin
ln -s $HOME/.dotfiles/git/.gitignore_global $HOME/.gitignore_global

touch $HOME/.zshrc_local
