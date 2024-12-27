# TTY login fetch
This script generate dinamic /etc/issue file with some system info, a logo based on ufetch style and the list of available users.

<p align="center">
	<img src="https://github.com/Gobytego/LukeOS/blob/master/Screenshots/loginscreen.png">
</p>

## Install
Exec `install.sh` script to install loginfetch, dependences and apply configs. Install do this actions in your system:
  * Install `loginfetch` script for generate a `/etc/issue` each time tty login is displayed.
  * Config runlevel to `multi-user.target`.
  * Install and config [Physlock](https://github.com/muennich/physlock), a tty locker called when come back of suspend mode.
  * Config `tty1` for autoexec startx when login.


```
