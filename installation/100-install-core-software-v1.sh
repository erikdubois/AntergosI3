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

#software from 'normal' repositories
sudo pacman -S --noconfirm --needed arc-gtk-theme archey3 baobab bleachbit catfish clementine clipit curl
sudo pacman -S --noconfirm --needed darktable dconf-editor
sudo pacman -S --noconfirm --needed dmidecode 
sudo pacman -S --noconfirm --needed evince evolution filezilla 
sudo pacman -S --noconfirm --needed galculator geary gimp git glances gnome-disk-utility 
sudo pacman -S --noconfirm --needed gnome-font-viewer gnome-tweak-tool 
sudo pacman -S --noconfirm --needed gparted gpick grsync
sudo pacman -S --noconfirm --needed hardinfo hddtemp hexchat htop 
sudo pacman -S --noconfirm --needed inkscape inxi lm_sensors meld mlocate mpv
sudo pacman -S --noconfirm --needed nemo numlockx openshot opera pinta plank 
sudo pacman -S --noconfirm --needed redshift ristretto sane screenfetch scrot shotwell 
sudo pacman -S --noconfirm --needed shutter simple-scan simplescreenrecorder smplayer sysstat 
sudo pacman -S --noconfirm --needed terminator thunar transmission-cli transmission-gtk
sudo pacman -S --noconfirm --needed variety vlc vnstat wget unclutter  


###############################################################################################

# installation of zippers and unzippers
sudo pacman -S --noconfirm --needed unace unrar zip unzip sharutils  uudeview  arj cabextract file-roller

###############################################################################################


numlockx on
sudo systemctl enable vnstat
sudo systemctl start vnstat

echo "################################################################"
echo "###################    core software installed  ################"
echo "################################################################"

