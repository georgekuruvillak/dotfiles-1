#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(which git)
stow=$(which stow)
curl=$(which curl)
code=$(which code)

if [ ! -d "$install_path" ]; then
  $git clone https://github.com/fntlnz/dotfiles $install_path
fi

pushd $install_path
$curl -L -o gdb/.gdbinit https://git.io/.gdbinit
$curl -L -o fish/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
$stow nvim
$stow zsh
$stow tmux
$stow git
$stow gdb
$stow gnupg
$stow i3
$stow dunst
$stow pam
$stow systemd
$stow fish
$stow vscode
popd

fish -c fisher

$code --install-extension eamodio.gitlens
$code --install-extension lukehoban.Go
$code --install-extension ms-vscode.cpptools
$code --install-extension onsi.vscode-ginkgo
$code --install-extension redhat.java
$code --install-extension twxs.cmake
$code --install-extension vector-of-bool.cmake-tools
$code --install-extension zxh404.vscode-proto3
$code --install-extension dracula-theme.theme-dracula
