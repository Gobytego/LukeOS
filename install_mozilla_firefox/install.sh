#!/bin/bash
# ACTION: Install Mozilla Firefox-ESR, This is the Extended Service Release
# INFO: Mozilla Firefox is an opensource and very popular web browser
# DEFAULT: n

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Install package
echo -e "\e[1mInstalling packages...\e[0m"
apt-get install -y firefox-esr

# Set as default
echo -e "\e[1mSetting as default alternative...\e[0m"
update-alternatives --set x-www-browser /usr/bin/firefox-esr
update-alternatives --set gnome-www-browser /usr/bin/firefox-esr