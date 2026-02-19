#! /bin/bash

sudo pacman -Syu
sudo pacman -Sy \
	git     \
	openssh \
	chezmoi \
	nano    \
	vim     \
	iwd     \
	less    \
	python  \
	hwinfo

original_dir=$(pwd)
if [ ! -d "~/src/yay" ]; then
	mkdir -p ~/src/yay
	sudo pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay-git ~/src/yay
	cd ~/src/yay
	makepkg -si
	cd $original_dir
fi
yay -S bws-bin

read -p "Enter your username: " name
read -p "Enter your Github username: " github_username
read -p "Enter your email: " email
read -p "Enter your Bitwarden access token: " bitwarden_access_token
read -s -p "Enter your GPG key password: " password
gpg --batch --passphrase "$password" --quick-generate-key "$name <$email>" ed25519 default never
gpg_key_id=$(gpg --list-options show-only-fpr-mbox --list-secret-keys | grep "$email" | cut -d' ' -f1)
gpg --batch --pinentry-mode loopback --passphrase-fd 0 --quick-add-key "$gpg_key_id" cv25519 encrypt never <<< "$password"
gpg_key_id=$(gpg --list-secret-keys --keyid-format=long | grep sec | cut -d'/' -f2  | cut -d' ' -f1)
gpg_key=$(gpg --armor --export $gpg_key_id)
chezmoi init --promptString "Bitwarden access token=$bitwarden_access_token,Email address=$email,Github username=$github_username,Signing key=$gpg_key_id" https://www.github.com/0hDEADBEAF/0xCE01
chezmoi cd
chezmoi apply
sudo reboot
