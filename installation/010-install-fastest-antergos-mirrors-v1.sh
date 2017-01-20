#!/bin/bash

#======================================================================================
#                                
# Author  : Erik Dubois at http://www.erikdubois.be
# License : Distributed under the terms of GNU GPL version 2 or later
# 
# AS ALLWAYS, KNOW WHAT YOU ARE DOING.
#======================================================================================

echo "################################################################"
echo "####  T O O L  T O  F I N D  F A S T E S T   S E R V E R S   ###"
echo "################################################################"



echo "################################################################"
echo "####  F I N D I N G   S E R V E R S    B E  P A T I E N T    ###"
echo "################################################################"

# fixing the fastest antergos servers
sudo rankmirrors -n 0 /etc/pacman.d/antergos-mirrorlist > /tmp/antergos-mirrorlist && sudo cp /tmp/antergos-mirrorlist /etc/pacman.d


echo "################################################################"
echo "####       fastest servers from neighbourhood saved          ###"
echo "################################################################"


cat /etc/pacman.d/antergos-mirrorlist


sudo pacman -Syu


echo "################################################################"
echo "###################    Up to date         ######################"
echo "################################################################"

