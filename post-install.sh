#! /bin/sh


echo '
  __  __             _                   _____          _   _____           _        _ _
 |  \/  |           (_)                 |  __ \        | | |_   _|         | |      | | |
 | \  / | __ _ _ __  _  __ _ _ __ ___   | |__) |__  ___| |_  | |  _ __  ___| |_ __ _| | |
 | |\/| |/ _  |  _ \| |/ _  |  __/ _ \  |  ___/ _ \/ __| __| | | |  _ \/ __| __/ _  | | |
 | |  | | (_| | | | | | (_| | | | (_) | | |  | (_) \__ \ |_ _| |_| | | \__ \ || (_| | | |
 |_|  |_|\__,_|_| |_| |\__,_|_|  \___/  |_|   \___/|___/\__|_____|_| |_|___/\__\__,_|_|_|
                   _/ |
                  |__/
'
echo 'This script has been tested only on Linux Manjaro KDE 15.9'

echo -n "Should we start? [Y|n] "
read yn
yn=${yn:-y}
if [ "$yn" != "y" ]; then
  echo "aborting script!"
  exit
fi

_cwd="$(pwd)"


echo 'Setup a gpg encripting key to be able to use kwallet'
echo 'see https://wiki.archlinux.org/index.php/GnuPG'
echo -n "create your gpg encrypting key? [Y|n] "
read yn
yn=${yn:-y}
if [ "$yn" == "y" ]; then
  gpg --full-gen-key
fi

## Yaourt
echo 'ask for editing config file before build'
echo "EDITFILES=1" >> ~/.yaourtrc

echo 'ILoveCandy'
sudo sed -i.back 's/.*\[options\].*/&\nILoveCandy/' /etc/pacman.conf

echo 'Packages installation'
# sleep 3
# sudo pacman -S --needed --noconfirm gimp inkscape scribus fontforge audacity blender vim chromium firefox-firebug firefox-adblock-plus
# following is not working, don't know why
# sudo xargs yaourt -S --needed --noconfirm < ./manjaro-my-packages.txt

echo 'Package installation finished'
sleep 3

echo 'Misc'
sleep 3
touch /home/$USER/.inputrc
echo 'set show-all-if-ambiguous on' >> /home/$USER/.inputrc
echo 'set completion-ignore-case on' >> /home/$USER/.inputrc

echo 'Git Completion'
sleep 3
sudo pacman -S --needed --noconfirm bash-completion
sudo wget -O /etc/bash_completion.d/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

echo 'vim configuration'
sleep 3
cp $_cwd/vimrc /home/$USER/.vimrc
sudo cp $_cwd/vimrc /root/.vimrc

echo 'drush'
sleep 3
sudo chown -R root:users /usr/lib/drush
sudo chmod -R g+w /usr/lib/drush

echo 'increase inotify watch limit'
sleep 3
sudo cp $_cwd/90-inotify.conf /etc/sysctl.d/

echo 'LAMP'
sleep 3

echo 'Load apache rewrite module'
LoadModule rewrite_module modules/mod_rewrite.so



echo -n "Reboot? [Y|n] "
read yn
yn=${yn:-y}
if [ "$yn" != "y" ]; then
  echo "please reboot"
  exit
fi

reboot
