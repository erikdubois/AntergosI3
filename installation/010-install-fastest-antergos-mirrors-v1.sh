#!/bin/bash
set -e
#======================================================================================
#                                
# Author  : Erik Dubois at http://www.erikdubois.be
# License : Distributed under the terms of GNU GPL version 2 or later
# 
# AS ALLWAYS, KNOW WHAT YOU ARE DOING.
#======================================================================================
set -e

echo "################################################################"
echo "####  F I N D I N G   S E R V E R S    B E  P A T I E N T    ###"
echo "################################################################"

# fixing the fastest antergos servers
sudo rankmirrors -n 0 /etc/pacman.d/antergos-mirrorlist > /tmp/antergos-mirrorlist && sudo cp /tmp/antergos-mirrorlist /etc/pacman.d


echo "################################################################"
echo "####       fastest servers in your neighbourhood saved       ###"
echo "################################################################"


cat /etc/pacman.d/antergos-mirrorlist


sudo pacman -Syu


echo "################################################################"
echo "###################    Up to date         ######################"
echo "################################################################"

