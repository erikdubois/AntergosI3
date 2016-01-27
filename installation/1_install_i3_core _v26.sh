#!/bin/bash
#              `.-/::/-``
#            .-/osssssssso/.               
#           :osyysssssssyyys+-              
#        `.+yyyysssssssssyyyyy+.           
#       `/syyyyyssssssssssyyyyys-`         
#      `/yhyyyyysss++ssosyyyyhhy/`         
#     .ohhhyyyyso++/+oso+syy+shhhho.       
#    .shhhhysoo++//+sss+++yyy+shhhhs.      
#   -yhhhhs+++++++ossso+++yyys+ohhddy:     
#  -yddhhyo+++++osyyss++++yyyyooyhdddy-    
# .yddddhso++osyyyyys+++++yyhhsoshddddy`   
#`odddddhyosyhyyyyyy++++++yhhhyosddddddo   
#.dmdddddhhhhhhhyyyo+++++shhhhhohddddmmh.  
#ddmmdddddhhhhhhhso++++++yhhhhhhdddddmmdy  
#dmmmdddddddhhhyso++++++shhhhhddddddmmmmh  
#-dmmmdddddddhhyso++++oshhhhdddddddmmmmd- 
# .smmmmddddddddhhhhhhhhhdddddddddmmmms. 
#   `+ydmmmdddddddddddddddddddmmmmdy/.     
#      `.:+ooyyddddddddddddyyso+:.`
#======================================================================================

#======================================================================================
#                               I3 IMPROVED TILING
# 
# Author  : Erik Dubois at http://www.erikdubois.be
# License : Distributed under the terms of GNU GPL version 2 or later
# 
# AS ALLWAYS, KNOW WHAT YOU ARE DOING.
#======================================================================================
#                               
# Interesting Sources : 
#
# https://i3wm.org/docs/userguide.html
# https://github.com/Arakis/autologin-on-boot
# http://www.linuxveda.com/2013/04/02/how-to-install-and-configure-hp-printer-in-arch-linux/
#
#======================================================================================

# Made to be installed on a clean Antergos (wiki arch beginners guide part 1)
# no desktop environment, no display manager - directly on X11
# all kinds of programs are being used from different distro's but xfce4 is my preference.

# fstab for ssd 
# defaults,noatime,discard
# https://wiki.archlinux.org/index.php/Solid_State_Drives#Enable_TRIM_by_Mount_Flags
# sudo fstrim -v / and /home

########################################
########  AFTER  BARE  INSTALL #########
########################################

# No desktop environment or display manager  nor is it needed

echo "################################################################"
echo "installing xorg server"
echo "################################################################"

sudo pacman -S xorg-server xorg-server-utils xorg-xinit xorg-twm xterm --noconfirm


# if you know what graphic driver to include you can do it here
# but again not needed for many of us since the latest
# linux kernels seem to support many graphicacl hardware.
# Test out and if needed install any proprietary drivers from nvidia or ati.

# sudo pacman -S nvidia-340xx

########################################
########        C O R E        #########
########################################


#Core stuff i3

echo "################################################################"
echo "i 3  improved tiling core files"
echo "################################################################"

# at time of writing signature problem
# package is not corrupt
# nano /etc/pacman.conf and change 
# change to SigLevel   = Never 


# other solution is
# sudo mkdir /root/.gnupg
# sudo pacman-key --refresh-keys



sudo pacman -S i3-wm i3lock i3status --noconfirm

# Standard Menu system for i3
# sudo pacman -S dmenu
# if you want to have dmenu with LARGER fonts as they are relatively
# small depending on your screen
# You should install dmenu-xft which I will do later on when we can download from AUR

        # A U R   H E L P E R #

# downloading yaourt to get packer (comes from archlinux.fr)
# add these lines to the end of /etc/pacman.conf and update with sudo pacman -Syu
# https://wiki.archlinux.org/index.php/Pacman
# once I have yaourt I comment these lines out

########################################
#[archlinuxfr]
#SigLevel = Never
#Server = http://repo.archlinux.fr/$arch
########################################

# downloading yaourt to get packer (comes from archlinux.fr)

echo "################################################################"
echo "yaourt"
echo "################################################################"

sudo pacman -S yaourt --noconfirm

# now we are downloading the aur helper I like

echo "################################################################"
echo "packer"
echo "################################################################"

yaourt packer --noconfirm




#########################################

#########################################

#########################################
#
#        AUR      AUR       AUR      AUR      
# ONLY       ONLY      ONLY     ONLY     
#
#########################################

#########################################

#########################################






########        C O R E   i 3   A  U R    #########

echo "################################################################"
echo "Choose your Y and N wisely !!!"
echo "################################################################"

# alternative menu faster and only desktop apps

echo "################################################################"
echo "j4-dmenu-desktop-git"   
echo "################################################################"

packer j4-dmenu-desktop-git   --noedit --noconfirm

# alternative menu for i3 with larger fonts and font choice 

echo "################################################################"
echo "dmenu-xft for bigger fonts - Remove dmenu -- yes"
echo "################################################################"

packer dmenu-xft-mouse-height-fuzzy-history --noedit --noconfirm

# alternative information bar

echo "################################################################"
echo "i3 blocks"
echo "################################################################"

packer i3blocks --noedit --noconfirm


echo "################################################################"
echo "one more script and you can test i3 with startx"
echo "no software what so ever - it will try to start firefox, ..."
echo "################################################################"


echo "################################################################"
echo "making sure we have internet after booting"
echo "################################################################"

sudo systemctl enable dhcpcd@service



echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"

