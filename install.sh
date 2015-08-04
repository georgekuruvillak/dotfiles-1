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
git config --global alias.cf '!vim -p `git diff --name-only`'
git config --global alias.since  "\!f() { git log --pretty=format: --name-only --since=\"HEAD~\$1 days ago\" | sort | uniq ; }; f"

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
mkdir -p $HOME/.vim/after/ftplugin
ln -s $HOME/.dotfiles/vim/ftplugin/* $HOME/.vim/after/ftplugin

# Fonts rendering
sudo cp $HOME/.dotfiles/fonts/local.conf /etc/fonts/local.conf

# Gnome Terminal
$HOME/.dotfiles/gnome-terminal/base16-google.dark.sh

# ZSH
touch $HOME/.zshrc_local

cat<<EOF
                        _
                       | \
                       | |
                       | |
  |\                   | |
 /, ~\                / /
X     \`-.....-------./ /
 ~-. ~  ~              |
    \             /    |
     \  /_     ___\   /
     | /\ ~~~~~   \ |
     | | \        || |
     | |\ \       || )
    (_/ (_/      ((_/
EOF
