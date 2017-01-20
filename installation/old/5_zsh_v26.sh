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
#==========================================================================================

# Installation of zsh and oh-my-zsh

echo "################################################################"
echo "installing zsh"
echo "################################################################"

sudo pacman -S zsh --noconfirm


#zsh enhancements

echo "################################################################"
echo "zsh-syntax-highlighting"
echo "################################################################"

packer zsh-syntax-highlighting --noedit --noconfirm

echo "################################################################"
echo "installing zsh-completions"
echo "################################################################"

packer zsh-completions  --noedit --noconfirm


# Installation of OH-MY-ZSH from the github (best way to install!!)

echo "################################################################"
echo "downloading from github"
echo "################################################################"

wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

# changing the theme to random so you can enjoy tons of themes.

sudo sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"random\"/g' ~/.zshrc

# If above line did not work somehow. This is what you should do to enjoy the many themes.
# go find the hidden .zshrc file and look for ZSH_THEME="robbyrussell" (CTRL+H to find hidden files)
# change this to ZSH_THEME="random

# You have to type this again - the password prompt is gone too fast

echo "################################################################"
echo "oh-my-zsh"
echo "You need to type this. Use your own name"
echo "sudo chsh username -s /bin/zsh"
echo "################################################################"


echo "################################################################"
echo "You need to type this. Use your own name"
echo "sudo chsh username -s /bin/zsh"
echo "################################################################"


echo "################################################################"
echo "You need to type this. Use your own name"
echo "sudo chsh username -s /bin/zsh"
echo "################################################################"


echo "################################################################"
echo "####         R E B O O T  T O  S E E  Z S H                ####"
echo "################################################################"


echo "################################################################"
echo "####         R E B O O T  T O  S E E  Z S H                ####"
echo "################################################################"




echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"
