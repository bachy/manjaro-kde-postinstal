# Gigabyte P34W V4 manjaro KDE 64 postinstall

post installation actions after installing manjaro kde in a Gigabyte P34W v4 i7 GTX970m laptop

## install
install went well, restarted nicely on fresh system.

following are some links about what the post-install.sh script do

## gpg encrypting key
setup a gpg encripting key to be able to use kwallet
https://wiki.archlinux.org/index.php/GnuPG

## Yaourt
ask for editing config file before build
```echo "EDITFILES=1" >> ~/.yaourtrc```   

## Vim
```sudo pacman -S gvim```
https://wiki.archlinux.org/index.php/Vim/.vimrc

## apple magicmouse
http://askubuntu.com/questions/261791/how-to-set-the-scroll-speed-of-apple-magic-mouse

## nvidia gpu
https://wiki.archlinux.org/index.php/Bumblebee

## automount external usb storage   
https://wiki.archlinux.org/index.php/Udisks#Mount_helpers   
https://wiki.archlinux.org/index.php/Udisks#udisks2:_mount_to_.2Fmedia    

```sudo pacman -S udevil```

```sudo cat '# UDISKS_FILESYSTEM_SHARED    
 # ==1: mount filesystem to a shared directory (/media/VolumeName)    
 # ==0: mount filesystem to a private directory (/run/media/$USER/VolumeName)    
 # See udisks(8)     
ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"' >> /etc/udev/rules.d/99-udisks2.rules```

then add devmon to autostart on kde system settings

## automount nfs folder (eg. from NAS)
https://wiki.manjaro.org/index.php?title=Fstab_-_Use_SystemD_automount
https://wiki.archlinux.org/index.php/NFS#Mount_using_.2Fetc.2Ffstab_with_systemd


if you need to mount webdav share
```sudo pacman -S davfs2```

## LAMP
https://wiki.archlinux.org/index.php/LAMP

### Apache
```sudo pacman -S apache```     
then configure root/directory, vhosts, etc       
/!\ don't forget to activate url rewriting in http.conf (for drupal for instance)      
```LoadModule rewrite_module modules/mod_rewrite.so```      
TODO add my apache conf file here      

### PHP
```sudo pacman -S php php-apache```       
had to edit /etc/php/php.ini to add my specifique root directory in open_base_dir      
http://kb.mediatemple.net/questions/514/How+do+I+set+the+path+for+open_basedir%3F#gs         
```sudo pacman -S php-gd php-pear php-mcrypt php-apcu```


### Mysql
Mysql is already installed with KDE (used by akonady server)       
https://wiki.archlinux.org/index.php/MySQL
phpmyadmin https://wiki.archlinux.org/index.php/PhpMyAdmin      
mysql logs (not working for me) : http://www.pontikis.net/blog/how-and-when-to-enable-mysql-logs        
on /etc/mysql/my.conf edit the max_allowed_packet property to avoid the 2006 error and comment the log-bin=mysql-bin

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

## atom-editor
```
yaourt -S atom-editor
```

## backintime
i had to edit the build config file to avoid conflit with backintime-gnome and backintime-gtk
```yaourt -S backintime```
then configure backups

## Openvpn
```
sudo pacman -S openvpn networkmanager-openvpn
sudo systemctl restart NetworkManager
```

## TLP (laptop power management)
disable wifi and bluetooth on startup on battery   
https://wiki.archlinux.org/index.php/TLP#Configuration

## notes
http://forum.notebookreview.com/gigabyte/720497-gigabyte-p34g-print.html
http://forum.notebookreview.com/gigabyte/746798-gigabyte-p34g-linux.html
