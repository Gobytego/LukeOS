#! /bin/bash




# #######################################
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


echo “updating system packages and getting your system ready”
sudo apt update -qq
sudo apt upgrade -yy -qq
sudo apt dist-upgrade -yy -qq
sudo apt autoremove -yy -qq


# make a hidden work directory 


mkdir ./.lukeos
cd .lukeos


# check for needed tools and install them


dpkg -l | grep -qw PKGNAME || sudo apt install -yyq PKGNAME


# ask if they want a full conversion or not


# ask what distro flavor is installed


# if they say yes remove unwanted 


dpkg -l | grep -qw PKGNAME || sudo apt remove -yyq PKGNAME


# install all packages now


echo “installing all the main components” 
sudo apt install -yyq youtube-dl youtube-dlg fish cinnamon-desktop-environment geary clementine rsync grsync
# add more to this


# set fish as default shell


chsh -s /usr/bin/fish


# download and install /etc/skel and /home/user
# configuration


me="$(whoami)"


wget https://gobytego.com/lukeosfeu.tar


tar -C .lukeos -xvf lukeosfeu.tar
sudo cp * /etc/skel 
sudo cp * /home/”$me”


# cleanup and reboot
