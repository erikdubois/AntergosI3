#!/bin/bash
set -e
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

echo "###############################################################################"
echo "DID YOU CHANGE THE NAME OF THE LOGIN in the file autologin@.service"
echo "###############################################################################"

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

echo "###############################################################################"
echo "DID YOU CHANGE THE NAME OF THE LOGIN in the file autologin@.service"
echo "###############################################################################"
echo
echo "cd settings"
echo "nano autologin@.service"
echo "look for my name erik and change it your login"
echo "save it with CTRL+X"
echo "cd .."
echo "run script 600 again if you just now changed your login"
echo
echo "Finally you can reboot and start computing"
echo "You will be logged in automatically."
echo "Type in the terminal the following code"
echo "sudo reboot"