#!/bin/bash
#never use the next line in this script or pasystray will not be installed
#set -e
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

echo "################################################################"
echo "#########   distro specific software installed  ################"
echo "################################################################"

#Fonts

## sudo pacman -S ttf-ubuntu-font-family --noconfirm --needed conflicts with ttf-google-fonts
## sudo pacman -S ttf-droid --noconfirm --noconfirm --needed  conflicts with ttf-google-fonts
## sudo pacman -S ttf-inconsolata --noconfirm --needed        conflicts with ttf-google-fonts
sudo pacman -S noto-fonts --noconfirm --needed

#file manager

sudo pacman -S nemo --noconfirm --needed


#Fonts

#sudo pacman -S ttf-ubuntu-font-family --noconfirm --needed
#sudo pacman -S ttf-droid --noconfirm --noconfirm --needed
#sudo pacman -S ttf-inconsolata --noconfirm --needed

#Utilities
sudo pacman -S pamac --noconfirm --needed 
sudo pacman -S notify-osd  --noconfirm --needed
sudo pacman -S lxappearance --noconfirm --needed
sudo pacman -S feh --noconfirm --needed
sudo pacman -S arandr --noconfirm --needed
sudo pacman -S qt4 --confirm --needed
sudo pacman -S xorg-xrandr --noconfirm --needed
sudo pacman -S gvfs  --noconfirm --needed
sudo pacman -S compton  --noconfirm --needed
sudo pacman -S volumeicon  --noconfirm --needed
sudo packer -S arandr  --noconfirm 
#run with systemadm
sudo packer -S systemd-ui  --noconfirm 



        # S Y S T E M  T O O L S # 

# steering spotify from the keyboard G15 Logitech - volume and next/previous/stop/pause

echo "################################################################"
echo "playerctl"
echo "################################################################"

package="playerctl"

#----------------------------------------------------------------------------------

#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

	echo "################################################################"
	echo "################## "$package" is already installed"
	echo "################################################################"

else

	#checking which helper is installed
	if pacman -Qi packer &> /dev/null; then

		echo "Installing with packer"
		packer -S --noconfirm --noedit  $package

	elif pacman -Qi pacaur &> /dev/null; then
		
		echo "Installing with pacaur"
		pacaur -S --noconfirm --noedit  $package
		 	
	elif pacman -Qi yaourt &> /dev/null; then

		echo "Installing with yaourt"
		yaourt -S --noconfirm $package
			  	
	fi

	# Just checking if installation was successful
	if pacman -Qi $package &> /dev/null; then
	
	echo "################################################################"
	echo "#########  "$package" has been installed"
	echo "################################################################"

	else

	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "!!!!!!!!!  "$package" has NOT been installed"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

	fi

fi





echo "################################################################"
echo "trayicon for sound for bluetooth headphone"
echo "################################################################"


package="pasystray-gtk3-standalone"

#----------------------------------------------------------------------------------

#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

	echo "################################################################"
	echo "################## "$package" is already installed"
	echo "################################################################"

else

	#checking which helper is installed
	if pacman -Qi packer &> /dev/null; then

		echo "Installing with packer"
		packer -S --noconfirm --noedit  $package

	elif pacman -Qi pacaur &> /dev/null; then
		
		echo "Installing with pacaur"
		pacaur -S --noconfirm --noedit  $package
		 	
	elif pacman -Qi yaourt &> /dev/null; then

		echo "Installing with yaourt"
		yaourt -S --noconfirm $package
			  	
	fi

	# Just checking if installation was successful
	if pacman -Qi $package &> /dev/null; then
	
	echo "################################################################"
	echo "#########  "$package" has been installed"
	echo "################################################################"

	else

	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "!!!!!!!!!  "$package" has NOT been installed"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"


	fi

fi

echo "Pasystray is likely to cause problems"
echo "More info here : https://aur.archlinux.org/packages/pasystray/"
echo "To install pasytray, I will go to tmp file and run from there"
echo "Trying to solve the conflicts since in some of the pasystray packages there are two packages in the download"
echo "And they conflict."
echo "Running the script may help."

sudo pacman -U /tmp/packerbuild-1000/pasystray-gtk3-standalone/pasystray-gtk3-standalone/pasystray-gtk3-standalone-* --noconfirm

echo "If installation fails, go look for the file yourself via this command"
echo "sudo pacman -U /tmp/packerbuild-1000/pasystray-gtk3-standalone/pasystray-gtk3-standalone/pasystray-gtk3-standalone-xxx "

echo "If you see that pasystray is installed then move on. You can fix it also later."

###############################################################
#
#        EXTRA      EXTRA      EXTRA      EXTRA     EXTRA      
#
###############################################################


        # A U T O  L O G I N #
# alternative way to autologin that worked a year ago
# if you want to autologin - aka at home no danger
# https://github.com/Arakis/autologin-on-boot
# packer autologin-on boot --noedit
# /bin/autologin-on-boot
# sudo systemctl enable autologin-on-boot
# sudo systemctl start autologin-on-boot


echo "################################################################"
echo "#########   distro specific software installed  ################"
echo "################################################################"

