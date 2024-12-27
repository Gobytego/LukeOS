#!/bin/bash
# ACTION: Install flatpak and the flathub
# INFO: Flatpak and Flathub are the future of packages on linux.
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install flatpak
echo -e "\e[1mInstalling packages...\e[0m"
apt-get install -y flatpak

# Installing GnomeSoftware and Configuring Flatpak to be shown in gnome-software
echo -e "\e[1mInstalling packages...\e[0m"
apt-get -y install gnome-software gnome-software-plugin-flatpak
echo -e "\e[1mInstalling flathub...\e[0m"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


