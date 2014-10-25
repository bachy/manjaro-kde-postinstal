# Macbookpro manjaro postinstall

post installation actions after installing manjaro kde in a macbookpro 9.1

## grub + refind
I dont know why but my grub bootloader failed in some way on install
I used this page to make it work with refind

https://wiki.manjaro.org/index.php/Restore_the_GRUB_Bootloader

i followed it directly from my manjaro install since i was able to launch it with a "super GRUB2" memory stick, so i didn't had to chroot.

my partition table was like this
```
/dev/sda1: LABEL="EFI" TYPE="vfat"
/dev/sda2: LABEL="Osx" TYPE="hfsplus" 
/dev/sda3: LABEL="Recovery HD" TYPE="hfsplus" 
/dev/sda4: LABEL="Data" TYPE="ext4" 
/dev/sda5: LABEL="boot" TYPE="ext4"
/dev/sda6: LABEL="Linux 3" TYPE="ext4"
/dev/sda7: LABEL="Linux 2" TYPE="ext4"
/dev/sda8: LABEL="Manjaro" TYPE="ext4"
/dev/sda9: TYPE="swap"
```
## data
edit /etc/fstab to mount /dev/sda4 on /mnt/data on startup
replace all home folders with aliases pointing to /mnt/data/bachir/*

## gpg encrypting key
setup a gpg encripting key to be able to use kwallet
https://wiki.archlinux.org/index.php/GnuPG

## basique softwares
```
sudo pacman -S vim chromiun firefox firefox-firebug firefox-adblock-plus synapse zeitgeist filezilla bash-completion
```
## keyboard
https://wiki.archlinux.org/index.php/Apple_Keyboard
https://wiki.manjaro.org/index.php/Keyboard_Layout

## trackpad
https://wiki.archlinux.org/index.php/Touchpad_Synaptics#Installation

my config on /etc/X11/xorg.conf.d/50-my-synaptics.conf
```
Section "InputClass"
	Identifier "touchpad"
	Driver "synaptics"
	MatchIsTouchpad "on"
	Option "TapButton1" "1"
	Option "TapButton2" "2"
	Option "TapButton3" "3"
	Option "VertEdgeScroll" "on"
	Option "VertTwoFingerScroll" "on"
	Option "HorizEdgeScroll" "on"
	Option "HorizTwoFingerScroll" "on"
	#Option "CircularScrolling" "on"
	#Option "CircScrollTrigger" "2"
	#Option "EmulateTwoFingerMinZ" "40"
	#Option "EmulateTwoFingerMinW" "8"
	Option "CoastingSpeed" "2"
	Option "FingerLow" "35"
	Option "FingerHigh" "40"
	Option "MaxTapTime" "180"
	Option "MaxTapMove" "535"
	Option "LockedDrag" "1"
	Option "LockedDragTimeout" "250"
EndSection
```

## bluetooth
... bluez ...

## konsole
http://abdussamad.com/archives/503-Changing-Konsole-colors-in-KDE.html

## vim
https://wiki.archlinux.org/index.php/Vim/.vimrc

## owncloud
```yaourt -S owncloud-client```

## dropbox
```yaourt -S dropbox```

## LAMP
https://wiki.archlinux.org/index.php/LAMP

### Apache
```sudo pacman -S apache```
then configure root/directory, vhosts, etc
don't foret to activate url rewriting in http.conf (for drupal for instance)
```LoadModule rewrite_module modules/mod_rewrite.so```

### PHP
```sudo pacman -S php php-apache```
had to edit /etc/php/php.ini to add my specifique root directory in open_base_dir
http://kb.mediatemple.net/questions/514/How+do+I+set+the+path+for+open_basedir%3F#gs

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

## haroopad
```yaourt -s haroopad```

## sublimetext 3 (dev)
```yaourt -S sublime-text-dev```
then install package control

## backitime
```yaourt -S backintime-kde4```
then configure backups

