etch#!/bin/bash
# ACTION: Install some basic CLI packages
# INFO: Debian netinstall comes with few list of CLI installed packages
# INFO: Some basic packages are: eza cowsay micro vim zip unzip rar unrar mtp-tools mailutils traceroute acl gnupg2 apt-transport-https curl ntfs-3g nala neofetch
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install free packages
echo -e "\e[1mInstalling packages...\e[0m"
[ "$(find /var/cache/apt/pkgcache.bin -mtime 0 2>/dev/null)" ] || apt-get update  
apt-get install -y eza cowsay micro vim zip unzip rar unrar mtp-tools mailutils traceroute acl gnupg2 apt-transport-https curl ntfs-3g nala neofetch
apt-get install -y firmware-linux-nonfree
  
