#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(command -v git)
stow=$(command -v stow)
code=$(command -v code-insiders)

if [ ! -d "$install_path" ]; then
  $git clone https://github.com/fntlnz/dotfiles "$install_path"
fi

pushd "$install_path"

if [ ! -d i3/.config/i3/i3blocks-contrib ]; then
  $git clone https://github.com/vivien/i3blocks-contrib.git i3/.config/i3/i3blocks-contrib
  pushd i3/.config/i3/i3blocks-contrib/bandwidth2
  make
  popd
fi

$stow nvim
$stow zsh
$stow tmux
$stow git
$stow gdb
$stow gnupg
$stow systemd
$stow background
$stow kitty
$stow user-dirs
$stow i3
$stow dunst
$stow screenlayout
$stow xorg
#$stow picom
$stow vscode
popd

$code --install-extension eamodio.gitlens
$code --install-extension ms-vscode.Go
$code --install-extension ms-vscode.cpptools
$code --install-extension vscjava.vscode-java-pack
$code --install-extension twxs.cmake
$code --install-extension vector-of-bool.cmake-tools
$code --install-extension zxh404.vscode-proto3
$code --install-extension ms-python.python
$code --install-extension rust-lang.rust
$code --install-extension timonwong.shellcheck
$code --install-extension yzhang.markdown-all-in-one
$code --install-extension slevesque.vscode-hexdump
$code --install-extension pkief.material-icon-theme
$code --install-extension ms-vscode-remote.vscode-remote-extensionpack
$code --install-extension plorefice.devicetree
$code --install_extension matepek.vscode-catch2-test-adapter
$code --install_extension github.vscode-pull-request-github
$code --install_extension redhat.vscode-yaml
