#!/bin/bash

# Enable multilib repository (needed for Steam dependencies)
sudo sed -i '/^#\[multilib\]/,/^#Include/s/^#//' /etc/pacman.conf

# Update packages/system
sudo pacman -Syu

# Update yay packages
yay
