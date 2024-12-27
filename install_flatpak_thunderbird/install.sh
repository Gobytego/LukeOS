#!/bin/bash
# ACTION: Install flatpak version of thunderbird
# INFO: Flatpak version of thunderbird is the future.
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install flatpak
echo -e "\e[1mInstalling packages...\e[0m"
flatpak install flathub org.mozilla.Thunderbird