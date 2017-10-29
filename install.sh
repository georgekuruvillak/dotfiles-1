#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(which git)
stow=$(which stow)
code=$(which code)

if [ ! -d "$install_path" ]; then
  $git clone https://github.com/fntlnz/dotfiles $install_path
fi

pushd $install_path
$stow nvim
$stow tmux
$stow git
$stow gdb
$stow zsh
$stow i3
$stow screenlayout
$stow dunst
$stow gnupg
$stow vscode
popd

# Code setup
$code --install-extension  donjayamanne.python
$code --install-extension  eamodio.gitlens
$code --install-extension  lukehoban.Go
$code --install-extension  ms-vscode.cpptools
$code --install-extension  onsi.vscode-ginkgo
$code --install-extension  redhat.java
$code --install-extension  twxs.cmake
$code --install-extension  vector-of-bool.cmake-tools
$code --install-extension  vscodevim.vim
$code --install-extension  zxh404.vscode-proto3
$code --install-extension  dracula-theme.theme-dracula
