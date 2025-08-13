#!/bin/bash

# Update packages/system
sudo pacman -Syu

# Install yay
mkdir -p ~/src
cd ~/src
if [ ! -d "yay" ]; then
	sudo pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay-git ~/src/yay
	cd yay
	makepkg -si
fi

# Update yay packages
yay

# Install rust and set the default toolchain to stable 
yay -Sy rustup
rustup default stable

# Install packages
# kitty: My favorite terminal
# nvim: The best editor
# librewolf-bin: The best browser (compiling from source takes hours so using the bin only)
# mold: The best linker
# bat: A better 'cat' command
# ripgrep: A better 'grep' command
# fd: A better 'find' command
# zoxide: A better 'cd' command
# eza: A better 'ls' command
# yazi: My favorite file manager
# zsh: My favorite shell
# fzf: A very nice tool :D
yay -Sy \
    kitty \
    nvim \
    librewolf-bin \
    mold \
    bat \
    ripgrep \
    fd \
    zoxide \
    eza \
    yazi \
	zsh \
	fzf

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup fzf for zsh
zsh -c "source <(fzf --zsh)"

