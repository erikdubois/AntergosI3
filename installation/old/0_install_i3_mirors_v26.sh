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

echo "################################################################"
echo "####  T O O L  T O  F I N D  F A S T E S T   S E R V E R S   ###"
echo "################################################################"


# installing refector to test wich servers are fastest
sudo pacman -S reflector --noconfirm


echo "################################################################"
echo "####  F I N D I N G   S E R V E R S    B E  P A T I E N T    ###"
echo "################################################################"

# finding the fastest archlinux servers
sudo reflector -l 50 -f 20 --save /tmp/mirrorlist.new && rankmirrors -n 0 /tmp/mirrorlist.new > /tmp/mirrorlist && sudo cp /tmp/mirrorlist /etc/pacman.d

# fixing the fastest antergos servers
sudo rankmirrors -n 0 /etc/pacman.d/antergos-mirrorlist /tmp/antergos-mirrorlist && sudo cp /tmp/antergos-mirrorlist /etc/pacman.d

echo "################################################################"
echo "####                   U P D A T I N G                       ###"
echo "################################################################"


sudo pacman -Syyu


echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"

