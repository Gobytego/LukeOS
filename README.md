# LukeOS Script for Debian
<img align="left"  src="https://www.debian.org/Pics/openlogo-50.png" width="90"> 

This script installs all essential tools and applies configurations, styles and themes. You can install all scripts from bare Debian netinstall to config full environment or **exec only some scripts** you are interested. Each folder has a particular action script for install pacakges, add scripts, apply configs or install some themes or styles.

The main script `install` can exec all scripts or only a select list:
  * `install`: exec all scripts interactively.
  * `install -l`: list all scripts.
  * `install -d`: install all scripts with default option Y.
  * `install -a 5,8-12`: exec selected scripts.
  * `install -a grub`: exec all actions with `grub` in description.

&nbsp; 
## Main features
  * Install Openbox and dependences.
  * Install and config essential Openbox tools: Tint2, Rofi, Terminator, Thunar, volume control, gsimplecal, etc.
  * Config a basic themes and styles for Openbox, Gtk, fonts, icon pack, wallpapers, exit menu.
  * Install some user tools: Chrome browser, sudo,nomacs image viewer, and others.
  * Config prompt,  path, aliases and home directories permissions.
  * Config Grub for skip menu or protect by password and show messages during boot.
  * Install [**`Numix-Paper icon theme`**](https://github.com/Gobytego/LukeOS/tree/master/10_openbox_numix-paper-icons), a theme based on Numix and Paper icon packs.
  * Install [**`autosnap Windows for Openbox`**](https://github.com/Gobytego/LukeOS/tree/master/10_openbox_autosnap), a script for autosnap active windows (half-maximice). 
  * Install [**`loginfetch`**](https://github.com/Gobytego/LukeOS/blob/master/script_loginfetch/README.md), a tty login based on ufetch style and config tty lock screen with physlock.
  * Install [**`update-notification script`**](https://github.com/Gobytego/LukeOS/tree/master/10_openbox_update-notification) for check and manage repositories updates.
  * Install [**`brightness control script`**](https://github.com/Gobytego/LukeOS/tree/master/script_brightness-control) for increase/decrease birghtness screen.
  * Install [**`exit menu`**](https://github.com/Gobytego/LukeOS/tree/master/10_openbox_exit-menu) based on rofi to show power and exit options.



&nbsp; 
## Install
  * Install Debian 10/11/12/sid using netinstall image. Its recommended don't install `Debian desktop environment`, install only `standard system utilities`.
<img align="center" width="700" src="https://github.com/Gobytego/LukeOS/blob/master/Screenshots/debianinstall.png">
  
  * Connect to Internet. If you need to connect to WIFI network in CLI you can do:
  ```
  ip a                                                                   # To get your wlan interface name, mine is wlp5s0
  iwlist wlp5s0 scan | egrep "Address|ESSID"                             # To get available wifi networks
  wpa_supplicant -B -i wlp5s0 -c <(wpa_passphrase YOUR-SSID YOUR-PASS)   # To authenticate in your wifi network
  dhclient -v wlp5s0                                                     # To get DHCP IP
  ```
  * Install git: `apt install git`
  * Clone or download this project: `git clone https://github.com/Gobytego/LukeOS`
  * Exec `install` script and select scripts you want to install. You may need to 'chmod +x install' to make the file executable first
  
```
$ ./install -h
Exec a set of scripts
Usage: install [-l] [-a <actions>] [-y] [-d] [-h]
   -l		Only list actions 
   -a <actions>	Filter selected actions by number range or text pattern (comma separated)
   -y		Auto-answer yes to all actions
   -d		Auto-answer default to all actions
   -h		Show this help


# Exec all actions interactively:
$ ./install

# Exec all actions and answer yes to all (no ask):
$ ./install -y

# Exec all actions and answer default to all (no ask and only exec actions with default Y):
$ ./install -d

# Exec only actions 5,7,10,11,12,13,14 and 15:
$ ./install -a 5,7,10-15

# Exec only actions with grub text in description:
$ ./install -a grub

# List all actions:
$ ./install -l
  NUM	TYPE	DESCRIPTION
===================================================================================================
 [1]   CONFIG   Add Debian repositories contrib and non-free (Y)
 [2]   INSTALL  Install some basic CLI packages (Y)
 [3]   INSTALL  Install some basic GUI packages (Y)
 [4]   OPENBOX  Install Openbox WM and essential tools and configs (Y)
 [5]   OPENBOX  Install theme Arc GTK and set as default (Y)
 [6]   OPENBOX  Install script autosnap for half-maximize windows with mouse middle click in titlebar (Y)
 [7]   OPENBOX  Install Conky and add basic sysinfo-shortcuts panel (Y)
 [8]   OPENBOX  Install script obexit with exit-power menu based on rofi (Y)
 [9]   OPENBOX  Install some popular fonts (Y)
 [10]  OPENBOX  Install Gthumb image viewer (Y)
 [11]  OPENBOX  Install clear xfce4-notify theme (Y)
 [12]  OPENBOX  Install icon theme Numix-Paper and set as default icons (Y)
 [13]  OPENBOX  Install rofi launcher and config as default launcher (Y)
 [14]  OPENBOX  Install Terminator terminal and configs (Y)
 [15]  OPENBOX  Install Thunar filemanager and some configs (show toolbar and double-click for active items) (Y)
 [16]  OPENBOX  Install tint2 taskbar and config some taskbar/menu themes (Y)
 [17]  OPENBOX  Install script update-notification for check periodically APT updates (Y)
 [18]  OPENBOX  Install pnmixer and pavucontrol volume control (Y)
 [19]  OPENBOX  Install nitrogen tool, copy wallpapers pack and set default wallpaper to all users (Y)
 [20]  CONFIG   Config some useful aliases (for ls, grep and ip commands) (Y)
 [21]  CONFIG   Config modified .profile file with new path (sbin for all users) and color definitions (Y)
 [22]  CONFIG   Config new bash prompt (Y)
 [23]  CONFIG   Config system for show text messages during boot time (Y)
 [24]  CONFIG   Disable some unnecessary services (Y)
 [25]  CONFIG   Config GRUB with password protection for prevent users edit entries (N)
 [26]  CONFIG   Config GRUB for skip menu (timeout=0) (N)
 [27]  CONFIG   Config users home directories permissions to 750 (for current and future users) (Y)
 [28]  CONFIG   Enable CTRL+ALT+BACKSPACE shortcut for kill X server (Y)
 [29]  CONFIG   Install sudo and add user 1000 to sudo group (Y)
 [30]  INSTALL  Install flatpak version of firefox (Y)
 [31]  INSTALL  Install flatpak and the flathub (Y)
 [32]  INSTALL  Install flatpak version of thunderbird (Y)
 [33]  INSTALL  Install Google Chrome, add to repositories and set has default browser (N)
 [34]  INSTALL  Install Mozilla Firefox-ESR, This is the Extended Service Release (N)
 [35]  SCRIPT   Install script poweroff_last for auto-poweroff if no users logged in 20 minutes (N)
 [36]  SCRIPT   Install script to control screen brightness (Y)
 [37]  SCRIPT   Config Linux login in text mode (tty) using ufetch style and install a tty locker (physlock) (Y)
```
  
&nbsp; 
## Customize
The script can be easily customized. Each `install.sh` script placed in a subdirectory are automatillacy recognized by `install`.
  * For **remove action** simply delete the action directory.
  * For **add action** simply add new folder and place inside `install.sh` script and dependences. `install.sh` script must have this header:
  ```
  #!/bin/bash
  # ACTION: Description of the action
  # INFO: Optional additional info
  # DEFAULT: y
  
  scripts commands to do action
  
  ```

&nbsp;  
## Lincense
LukeOS license is [GPLv3](LICENSE)
