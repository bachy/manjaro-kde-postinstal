# Gigabyte P34G V2 manjaro postinstall

post installation actions after installing manjaro kde in a Gigabyte P34G v2 i7 GTX860m laptop

## install
install went well, restarted nicely on fresh system.
But things went wrong when i had to update the 564 packages out of date
my live image was http://downloads.sourceforge.net/manjarolinux/manjaro-kde-0.8.10-x86_64.iso
there were a lot of changes, particularly on graphic card drivers, here is my post on manjaro forum : https://forum.manjaro.org/index.php?topic=16504.0

## data
edit /etc/fstab to mount /dev/sda4 on /mnt/data on startup
replace all home folders with aliases pointing to /mnt/data/bachir/*

## gpg encrypting key
setup a gpg encripting key to be able to use kwallet
https://wiki.archlinux.org/index.php/GnuPG

## basique softwares
```sudo pacman -S vim chromiun firefox firefox-firebug firefox-adblock-plus synapse zeitgeist filezilla bash-completion htop```
```yaourt -S retext python-markdown```

## keyboard
https://wiki.archlinux.org/index.php/Apple_Keyboard
https://wiki.manjaro.org/index.php/Keyboard_Layout

## touchpad
I had some problems at the begining with the Elantech touch pad, it was just invisible/deactivated/nothere ...
but after a real shutdown and wait some minutes then restart the computer, it was finally here
i hope this won't happen again

https://wiki.archlinux.org/index.php/Touchpad_Synaptics#Installation

```sudo pacman -S kcm-touchpad```

## bluetooth
... sudo pacman -S bluedevil1 ...

## konsole
http://abdussamad.com/archives/503-Changing-Konsole-colors-in-KDE.html

## vim
https://wiki.archlinux.org/index.php/Vim/.vimrc

## nvidia gpu
```sudo systemctl enable bumblebee```
https://wiki.archlinux.org/index.php/Bumblebee

## owncloud
```yaourt -S owncloud-client```

## dropbox
```yaourt -S dropbox```

## LAMP
https://wiki.archlinux.org/index.php/LAMP

### Apache
```sudo pacman -S apache```
then configure root/directory, vhosts, etc
/!\ don't foret to activate url rewriting in http.conf (for drupal for instance)
```LoadModule rewrite_module modules/mod_rewrite.so```

### PHP
```sudo pacman -S php php-apache```
had to edit /etc/php/php.ini to add my specifique root directory in open_base_dir
http://kb.mediatemple.net/questions/514/How+do+I+set+the+path+for+open_basedir%3F#gs
```sudo pacman -S php-gd php-pear php-mcrypt php-apcu```


### Mysql
dont try workbench-mysql, it took ages to build and finaly i dont see the utility for me
install as usual phpmyadmin instead !! https://wiki.archlinux.org/index.php/PhpMyAdmin
mysql logs (not working for me) : http://www.pontikis.net/blog/how-and-when-to-enable-mysql-logs
edit the max_allowed_packet property to avoid the 2006 error

### mysql backup cron
TODO

### drupal
https://wiki.archlinux.org/index.php/Drupal

## drush
```yaourt -S drush```
disable php options safe_mode, open_basedir, etc with /etc/drush/drush.ini
```
sudo chown -R root:users /usr/lib/drush
sudo chmod -R g+w /usr/lib/drush  
```

## haroopad
```yaourt -s haroopad```

## sublimetext 3 (dev)
```yaourt -S sublime-text-dev```
then install package control

## backitime
```yaourt -S backintime-kde4```
then configure backups

## notes
http://forum.notebookreview.com/gigabyte/720497-gigabyte-p34g-print.html