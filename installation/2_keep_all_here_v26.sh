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
#=======================================================================================

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
#
#======================================================================================


########################################
########  I3 K E E P  I T  L O C A L ###
########################################
# This file is an attempt to keep all necessary information on github
# for easy installation on an other computer
# Copy/paste line per line in terminal


# depending on how far you are in your installation some of these files
# will not yet exist - you can not remove what is not there
# ignore the errors


			# I 3  B L O C K S #

# use of i3blocks for bar 

ln -s ~/.i3/.i3blocks.conf ~/.i3blocks.conf

			# L X  A P P E A R A N C E #

# lxappearance will change two files - back these up to have them for later
# these files can be found in the installation folder
# making links does not seem to work - they are overwritten when changing the look

cp ~/.gtkrc-2.0 ~/.gtkrc-2.0_backup
rm ~/.gtkrc-2.0
ln -s ~/.i3/.gtkrc-2.0 ~/.gtkrc-2.0 

cp ~/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini_backup
rm ~/.config/gtk-3.0/settings.ini
ln -s ~/.i3/settings.ini ~/.config/gtk-3.0/settings.ini


			#  Z S H #
cp ~/.zshrc ~/.zshrc_backup
rm ~/.zshrc
ln -s ~/.i3/.zshrc ~/.zshrc

cp ~/.zlogin ~/.zlogin_backup
rm ~/.zlogin
ln -s ~/.i3/.zlogin ~/.zlogin

cp ~/.zprofile ~/.zprofile_backup
rm ~/.zprofile
ln -s ~/.i3/.zprofile ~/.zprofile



			# X I N I T R C #

cp ~/.xinitrc ~/.xinitrc_backup
rm ~/.xinitrc
ln -s ~/.i3/.xinitrc ~/.xinitrc



			# B A S H R C #

#obsolete if you use zsh
cp ~/.bashrc ~/.bashrc_backup
rm ~/.bashrc
ln -s ~/.i3/.bashrc ~/.bashrc


echo "#################################################################################"
echo "########    Y O U  C A N  S T A R T  I 3  W I T H  S T A R T X          #########"
echo "########    N O T  R E C O M M E N D E D    -  N O  S O F T W A R E     #########"
echo "########    W I N  +  S H I F T  +  E    T O   E X I T                  #########"
echo "#################################################################################"


echo "########################################"
echo "########    T H E   E N D      #########"
echo "########################################"
