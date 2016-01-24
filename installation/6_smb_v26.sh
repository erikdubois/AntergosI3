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



        # S A M B A #

# mkdir ~/Upload
# http://askubuntu.com/questions/101350/software-similar-to-nautilus-share-in-thunar
# net usershare add %n %f "" Everyone:F guest_ok=y && chmod 777 %f

sudo pacman -S samba --noconfirm
sudo cp  /etc/samba/smb.conf.default /etc/samba/smb.conf
sudo systemctl enable smbd.service
sudo systemctl start smbd.service
sudo systemctl enable nmbd.service
sudo systemctl start nmbd.service
sudo smbpasswd -a erik

#access samba share windows
sudo pacman -S gvfs-smb --noconfirm
#access samba share mac
sudo pacman -S gvfs-afp --noconfirm

# sudo systemctl restart ... if you run into trouble
# testparm will check the conf file for errors

# red hat samba sharing config 
packer system-config-samba --noedit --noconfirm
echo "Run system-config-samba to set up shares"


echo "########################################"
echo "######## T H E   E N D  + R E B O O T ##"
echo "########################################"
