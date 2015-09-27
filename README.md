# Gigabyte P34G V2 manjaro postinstall

post installation actions after installing manjaro kde in a Gigabyte P34G v2 i7 GTX860m laptop

## install
install went well, restarted nicely on fresh system.   
But things went wrong when i had to update the 564 packages out of date
my live image was http://downloads.sourceforge.net/manjarolinux/manjaro-kde-0.8.10-x86_64.iso
there were a lot of changes, particularly on graphic card drivers    
here is my post on manjaro forum : https://forum.manjaro.org/index.php?topic=16504.0    
i had a new problem with GPU drivers after system update :( https://forum.manjaro.org/index.php?topic=19941.0

## update
```sudo pacman -S pacman```
```sudo pacman -S manjaro-system```
```sudo pacman -Syu```

## gpg encrypting key
setup a gpg encripting key to be able to use kwallet
https://wiki.archlinux.org/index.php/GnuPG

## Yaourt
ask for editing config file before build
```echo "EDITFILES=1" >> ~/.yaourtrc```

## console
### terminator
```sudo pacman -S terminator```
### konsole
http://abdussamad.com/archives/503-Changing-Konsole-colors-in-KDE.html

## Bash tricks
```
echo 'set show-all-if-ambiguous on' >> ~/.inputrc
echo 'set completion-ignore-case on' >> ~/.inputrc
```

## vim
```sudo pacman -S gvim```
https://wiki.archlinux.org/index.php/Vim/.vimrc

## basique softwares
```sudo pacman -S kdeutils-kwalletmanager chromiun firefox firefox-firebug firefox-adblock-plus synapse zeitgeist filezilla bash-completion htop```

## touchpad
I had some problems at the begining with the Elantech touch pad, it was just invisible/deactivated/nothere ...       
but after a real shutdown, unpleged power and wait for more than 60 seconds then restart the computer, it was finally back      
https://wiki.archlinux.org/index.php/Touchpad_Synaptics#Installation       

manage your touchpad from kde      
```sudo pacman -S kcm-touchpad```

## bluetooth
manage your bluetooth devices from kde
... sudo pacman -S bluedevil ...

## apple magicmouse
http://askubuntu.com/questions/261791/how-to-set-the-scroll-speed-of-apple-magic-mouse
```
sudo rmmod hid_magicmouse
cat 'options hid_magicmouse scroll-speed=55 scroll-acceleration=1 emulate_2button=1 emulate_3button=1' > /etc/modprobe.d/magicmouse.conf
sudo modprobe hid_magicmouse
```

## nvidia gpu
```sudo systemctl enable bumblebee```
https://wiki.archlinux.org/index.php/Bumblebee

## owncloud
```yaourt -S owncloud-client```

## dropbox
```yaourt -S dropbox```

## udevil
automount external usb storage   
https://wiki.archlinux.org/index.php/Udisks#Mount_helpers   
https://wiki.archlinux.org/index.php/Udisks#udisks2:_mount_to_.2Fmedia    

```sudo pacman -S udevil davfs2```

```sudo cat '# UDISKS_FILESYSTEM_SHARED    
 # ==1: mount filesystem to a shared directory (/media/VolumeName)    
 # ==0: mount filesystem to a private directory (/run/media/$USER/VolumeName)    
 # See udisks(8)     
ENV{ID_FS_USAGE}=="filesystem|other|crypto", ENV{UDISKS_FILESYSTEM_SHARED}="1"' >> /etc/udev/rules.d/99-udisks2.rules```

then add devmon to autostart on kde system settings

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
dont try workbench-mysql, it took ages to build and finaly i dont see the utility for me        
install as usual phpmyadmin instead !! https://wiki.archlinux.org/index.php/PhpMyAdmin      
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

## Markdown
```yaourt -s haroopad```      
```yaourt -S retext python-markdown```     
```yaourt -s remarkable```        

## sublimetext 3 (dev)
```yaourt -S sublime-text-dev```
then install package control

## backintime
i had to edit the build config file to avoid conflit with backintime-gnome and backintime-gtk
```yaourt -S backintime```
then configure backups

## Openvpn
```
sudo pacman -S openvpn networkmanager-openvpn
sudo systemctl restart NetworkManager
```

## notes
http://forum.notebookreview.com/gigabyte/720497-gigabyte-p34g-print.html
http://forum.notebookreview.com/gigabyte/746798-gigabyte-p34g-linux.html

## misc
kdeplasma-applets-playbar (to control banshee through mrpis2 commands)
autojump
boabab
basket ??
cgit
choqok
clamav
clonezilla
deja-dup
emerillon
fdupes
filezilla
fontforge
grsync
httperf
innotop
keepass
keepnote
krename
ksshaskpass
powertop
rsnapshot
skrooge
smb4k
spectrwm
subtle
syncthing
tig
xdebug
xtrabackup
zim
