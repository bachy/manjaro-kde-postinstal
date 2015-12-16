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
# sudo pacman -S --needed --noconfirm gimp inkscape scribus fontforge audacity blender vim chromium firefox-firebug firefox-adblock-plus
sudo xargs yaourt -S --needed --noconfirm < ./manjaro-my-packages.txt

echo 'Misc'
touch /home/$USER/.inputrc
echo 'set show-all-if-ambiguous on' >> /home/$USER/.inputrc
echo 'set completion-ignore-case on' >> /home/$USER/.inputrc

echo 'Git Completion'
sudo pacman -S --needed --noconfirm bash-completion
sudo wget -O /etc/bash_completion.d/git-completion.bash https://github.com/git/git/blob/master/contrib/completion/git-completion.bash

echo 'vim configuration'
cp $_cwd/vimrc /home/$USER/.vimrc
sudo cp $_cwd/vimrc /root/.vimrc

echo 'drush'
sudo chown -R root:users /usr/lib/drush
sudo chmod -R g+w /usr/lib/drush


echo -n "Reboot? [Y|n] "
read yn
yn=${yn:-y}
if [ "$yn" != "y" ]; then
  echo "please reboot"
  exit
fi

reboot
