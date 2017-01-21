#!/bin/bash
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


echo "Creating all folders"

[ -d $HOME"/.icons" ] || mkdir -p $HOME"/.icons"
[ -d $HOME"/.config/conky" ] || mkdir -p $HOME"/.config/conky"
[ -d $HOME"/.config/variety" ] || mkdir -p $HOME"/.config/variety"
[ -d $HOME"/.config/variety/scripts" ] || mkdir -p $HOME"/.config/variety/scripts"
[ -d $HOME"/.themes" ] || mkdir -p $HOME"/.themes"
[ -d $HOME"/Desktop" ] || mkdir -p $HOME"/Desktop"
[ -d $HOME"/Documents" ] || mkdir -p $HOME"/Documents"
[ -d $HOME"/Downloads" ] || mkdir -p $HOME"/Downloads"
[ -d $HOME"/DATA" ] || mkdir -p $HOME"/DATA"
#[ -d $HOME"/Dropbox" ] || mkdir -p $HOME"/Dropbox" will be created by dropbox
[ -d $HOME"/Insync" ] || mkdir -p $HOME"/Insync"
[ -d $HOME"/Music" ] || mkdir -p $HOME"/Music"
[ -d $HOME"/Pictures" ] || mkdir -p $HOME"/Pictures"
[ -d $HOME"/Videos" ] || mkdir -p $HOME"/Videos"
[ -d $HOME"/fonts" ] || mkdir -p $HOME"/fonts"
[ -d $HOME"/.gimp-2.8" ] || mkdir -p $HOME"/.gimp-2.8"
[ -d $HOME"/.gimp-2.8/scripts" ] || mkdir -p $HOME"/.gimp-2.8/scripts"
[ -d $HOME"/.gimp-2.8/themes" ] || mkdir -p $HOME"/.gimp-2.8/themes"


echo "Moving files to start i3wm"
echo "Using Sardi icons, Arc theme and noto font from previous scripts"

cp settings/.bash_profile ~/
cp settings/.bashrc ~/
cp settings/.gtkrc-2.0 ~/
cp settings/.xinitrc ~/
cp settings/.zlogin ~/
cp settings/.zshrc ~/
cp settings/bookmarks ~/.config/gtk-3.0/
cp settings/settings.ini ~/.config/gtk-3.0/


echo "Copy/pasting Arc Colora themes to ~/.themes"

cp -r Arc\ Colora/* ~/.themes/


echo "Making sure firefox looks great in dark themes"

cp -r settings/firefox/chrome/ ~/.mozilla/firefox/*.default

echo "Making sure gnome-screenshot saves in jpg - smaller in kb"

sh settings/gnome-screenshot/set-gnome-screenshot-to-save-as-jpg.sh
echo "Do not mind the message."

echo "Copy/pasting gimp scripts and themes"

cp settings/gimp/scripts/* ~/.gimp-2.8/scripts/
cp -r settings/gimp/themes/* ~/.gimp-2.8/themes/

echo "Copy/pasting scripts for feh/variety to work"

cp settings/variety/* ~/.config/variety/scripts/


echo "Moving files to autostart X at boot"
# http://unix.stackexchange.com/questions/42359/how-can-i-autologin-to-desktop-with-systemd

echo "Did you change the autologin@.service file to include your own login ???"

#sudo cp /usr/lib/systemd/system/getty@.service /etc/systemd/system/autologin@.service
sudo cp settings/autologin@.service /etc/systemd/system/
sudo ln -sf /etc/systemd/system/autologin@.service /etc/systemd/system/getty.target.wants/getty@tty1.service
sudo systemctl enable autologin@tty1.service
sudo systemctl start autologin@tty1.service


echo "################################################################"
echo "#########       personal settings installed     ################"
echo "################################################################"

echo "Finally you can reboot and start computing"
echo "You will be logged in automatically."
echo "Type in the terminal the following code"
echo "sudo reboot"