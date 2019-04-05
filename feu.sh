#! /bin/bash

#######################################
# LukeOS 8.5 F.E.U. (For Existing Ubuntu) 
# release April 2019
#
# this is a program to change your Ubuntu install to
# the LukeOS set of customizations. 
# it is recommended to run this on a clean 
# netinstall with no desktop environment installed
# also while it has been tested on 18.04LTS it 
# should still work upto 19.04 and (hopefully) 
# beyond. 
#
# this will not work on other Debian-based or
# Ubuntu-based systems. 
# I take no responsibility if your system breaks 
# from running this program. 
# #######################################


# first let's update the system shall we… 

echo “updating system packages to get your system ready”
sudo apt update -qq
sudo apt upgrade -yy -qq
sudo apt dist-upgrade -yy -qq
sudo apt autoremove -yy -qq
echo "complete with system update, continuing on" 

# make a hidden work directory 

mkdir ./.lukeos
cd .lukeos

# check for needed tools and install them and configure nano

# sample 
# dpkg -l | grep -qw PKGNAME || sudo apt install -yyq PKGNAME

dpkg -l | grep -qw  wget || sudo apt install -yyq wget
dpkg -l | grep -qw  snapd || sudo apt install -yyq snapd
curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
echo set linenumbers >> ~/.nanorc

# ask if they want a full conversion or not


# ask what distro flavor is installed


# if they say yes remove unwanted 

# sample
# dpkg -l | grep -qw PKGNAME || sudo apt remove -yyq PKGNAME

# install all packages now

echo “installing all the main components” 
sudo apt install -yyq fish cinnamon-desktop-environment geary clementine rsync grsync libreoffice bleachbit
sudo apt remove - yyq thunderbird firefox 

sudo snap install brave

# add more to this

# set fish as default shell

chsh -s /usr/bin/fish

# download and install /etc/skel and /home/user
# configuration

# set variables 

me="$(whoami)"

# downloading needed files for configurations

# wget https://gobytego.com/lukeosfeu.tar

# unpack files and copy to proper locations

tar -C .lukeos -xvf lukeosfeu.tar
sudo cp * /etc/skel 
sudo cp * /home/”$me”


# cleanup and reboot

echo "doing final cleanup and rebooting your system" 
sudo apt update -qq
sudo apt upgrade -qq -yy
sudo apt autoremove -qq - yy
sudo shutdown -r 0
