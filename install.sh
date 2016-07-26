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
git config --global alias.lod "log --decorate"
git config --global alias.lodo "log --decorate --oneline"
git config --global alias.lof "log --color --pretty=format:'%C(yellow)%h%C(reset) %s%C(bold red)%d%C(reset) %C(green)%ad%C(reset) %C(blue)[%an]%C(reset)' --relative-date --decorate"

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


# ZSH
touch $HOME/.zshrc_local
