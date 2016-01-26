# Antergos + i3 windows manager


This is my configuration for I3 improved tiling to be used on Antergos.

https://antergos.com/

http://forum.antergos.com/

In the installation folder is all the data, explanations and scripts for you to have a great working environment but not directly a desktop environment.

I do not work with a display manager. Xorg and I3 provide all the display you will ever need.

I suggest you read up to better understand what a tiling window manager is.

It is really great once you have mastered the most important shortcuts.

https://i3wm.org/

# What can you achieve?

There is a fork where you can choose to have gaps between the windows.

Yltra Flat Orange on Antergos I3
Icons can be found at github
https://github.com/erikdubois/Yltra-Flat - with gaps

![Screenshots](http://i.imgur.com/xtILBj5.jpg)


no gaps
![Screenshots](http://i.imgur.com/MRH6EiB.jpg)



with gaps
![Screenshots](http://i.imgur.com/2bMwqsl.jpg)



no gaps
![Screenshots](http://i.imgur.com/UUw3NUM.jpg)


with gaps
![Screenshots](http://i.imgur.com/N9sNc4m.jpg)


no gaps
![Screenshots](http://i.imgur.com/DFdoVEE.jpg)


#What can you do if the script does not execute?

Explained at the bottom.



# A N T E R G O S    L I N U X 
--------------------------------

I started using Antergoslinux as a learning experience. I have tried installing all kinds of desktop environments (DE) and formatted many times my ssd's to start from scratch. After a while it was more practical to have a script of some kind to record the knowledge and to automate the things I had already learned. They became repetitive in nature.

The goal is to be quickly up and running after a clean install. 

That's why I have written a script to do just that. 

#1. Installation of the base system

I started following the guide of 

https://wiki.archlinux.org/index.php/Beginners%27_guide

After choosing the <b>base installation </b> during installation of Antergos, you will end up in a black screen (terminal) with no graphical environment what so ever. Then it is up to the user to choose a Desktop Environment.

Good options are

	- xfce
	- cinnamon
	- gnome
	- kde
	- openbox

But we will install i3 instead.

Choose for <b>Base installation</b> when installing Antergos.

#2. First boot

Set your keyboard right.

Depending on where you live, you might want to change your keyboard. The default keyboard is set to US. You will be typing in qwerty or en_US.UTF-8.

If you want to know what name of keyboard to use you can type : 
	
	localectl list-keymaps

Pageup and Pagedown moves you around.
q to quit the listing
Or you can pipe the same command to the command “less”

	localectl list-keymaps | less

Look at the first two letters that designate your country/keyboard or system.
E.g. us for America, wang for Wang computer and mac for Mac Osx.

TIP : you do not have to type all the words/letter, use the TAB and see if it completes automatically. 
Keep typing and trying TAB until you get what you want.

Our first command has been send. 

TIP : Remember that to stop processes or quit something, Linux usually takes “q”, CTRL + C, CTRL + X  or CTRL + W. 

I rarely know which one works, I go over all of them till it ends. 

If you accidentally get into “vi” which is a text editor, you can quit that by pressing “:q”.

Living in Belgium we type with an <b>azerty keyboard</b>. If I could not type blind, I would have switched to qwerty by now.

Living in Belgium I will type

	sudo loadkeys be-latin1

Now I can type in azerty format.

If you reboot right now, the system will have forgotten your keyboard and will revert to qwerty.

Therefor I will do the following steps to keep my azerty keyboard

	sudo nano /etc/locale.conf

Change this to

	KEYMAP=be-latin1

Save and exit with CTRL + X.


#3. Get the files from github

The idea is to download (if you have internet connection) the i3 github files. In my case I had internet connection straight after installing the base system and git was installed as well:

Git is NOT installed then
	
	sudo pacman -S git

Git is already installed then

	git clone https://github.com/erikdubois/antergosi3



#4. Move all files to correct directory

I3 works from a hidden directory namely .i3
Let us move all downloaded files there.


This downloaded folder should be movied to a hidden folder in your home directory with the name  ~/.i3

    mv antergosi3/ ~/.i3

Know that there are also hidden files as well.

	cd .i3   

    ls -al       



#5. Installation folder

I run an installation script to quickly  get all my software after <b>the base installation of Antergos</b>. For me this was quite a learning process, since I was a Redhat, Ubuntu, Linux Mint kind of guy over the last two decades. 

I decided to split the logical entities in seperate files. Better to debug and better for users to understand.

The scripts have been numbered from 0 to 7. Follow the order to install all programs.



#6. If problems with servers

Jan 2016

	cd .i3
	cd installation
    ls -al

	./0_install_i3_mirors_vx.sh

This will create a list with the fastest servers in your neighbourhood for arch and antergos servers.
In this script there are more solution to known problems. They are added as comments.



#7. Installing I3

  
    cd installation
    ls -al

    
    ./1_install_i3_core_vx.sh


If the choice comes up between choosing xf86-input-evdev and xf86-input-libinput, choose the first one.

This will install the actual i3 windows manager and xorg to render it. We will also make sure yaourt is installed. It is an option in Antergos base installation screens.
Yaourt is used to install <b>packer</b>. Packer will serve as the aur helper from there on.

In this script I included also the line to start dhcpd otherwise you will not have an internet connection after rebooting.

	sudo systemctl enable dhcpcd@service


no internet on lan, try these

    sudo systemctl enable dhcpcd
    sudo systemctl start dhcpcd


#8. Making links


	./2_keep_all_here_vx.sh

I have moved this script to the beginning. You can now test i3 already.
You can have a first peak at i3 by starting it with startx. It is not recommended as there is no software yet.
With WINDOWS + SHIFT + E you exit i3 again.

This script is my idea to have all my data in one folder i.e. .i3. I made symbolic links to files. I did notice that this is not so easy with the gtk files. The scripts makes backup files.

The zsh script is an alternative to bash more colourfull (>100 themes) and more plugins then you ever need. These links will be made as well. Zsh will be installed in a later script if you want it.




#9. Installation of software from Antergos/Archlinux repo's


    ./2_install_i3_Antergos_repo _v1

This will install all programs coming from the "normal" Antergos repositories with the use of pacman.




#10. Installation of software coming from AUR or community

    ./3_install_i3_aur_repo _vx.sh

This will install all programs coming from the AUR repositories with the use of packer.

You will have to decide which version you want. I would recommend the highest and most recent.

If you see a program, you do not want. Just press ENTER and no number and it will be skipped.
In the script you will see a text to know which one you need to choose.

    For example

    echo "################################################################"
    echo "sane"
    echo "################################################################"

#11. More colour to your terminal use zsh

    ./5_zsh_vx.sh

Zsh is a "nicer" shell than our bash shell and then there is oh-my-zsh that help make your terminal look "really cool".

More info on

https://github.com/robbyrussell/oh-my-zsh



#12. Samba to share between computers

The smb script is to install samba or the way to share folders and files between computers if you need it.

    ./6_smb_vx.sh



#13. Single or Dual monitor

In the config file of i3 I declared the names of my monitors.
You can find out your names with

	xrandr

Uncomment or comment these lines.

	set $firstMonitor DVI-I-1
	set $secondMonitor DVI-I-2

There is also a script included that might help. That is now commented out. This is to tell the system which screen should be on the left and which one on the right.


	dualscreen_autoset.sh


#14. Choose icons and themes

You can use the program lxappearance to change these settings

Type WIN + D  and choose lxappearance and press enter.

	lxappearance


#15. Choose fonts

Choosing fonts and size of them can be done with the program qtconfig-qt4. Press Win + D and type and press enter

	qtconfig-qt4


#16. Config file

Check <b>config</b> file in .i3 to see all the settings and more explanations.


#17. variety 

If you have transparent terminals and also if you use gaps in i3, it makes sense to have a wallpaper changer like variety.

You will have to edit one (or two) file(s) and delete some lines and you will have a GREAT working wallpaper with many sources but most importantly from desktopr.

Follow the dirty solution in my article :

http://erikdubois.be/how-to-make-variety-work-in-i3-windows-manager-linux-mint-17-3/

That will work on Antergos as well.

You can uncomment the feh line in the get_wallpaper as well.


#18. Geary

Geary is a small mail client I use to connect to my gmail account.

At the moment geary is victim of some kind of bug but we can fix it.

We get a wide black border around geary in i3.

Make a new file in this location

~/.config/gtk-3.0/gtk.css

Edit this file and copy/paste this code inside:

    .window-frame {
        box-shadow: none;
        margin: 0;
    }

https://github.com/shimmerproject/Numix/issues/206

Reboot


# 19. The links from step 4 are really important

When you see you are missing icons, spotify opens on wrong page and other stuff, you need to run this script once more to make backups of the files and replace them with links to your .i3 folder files.


    ./2_keep_all_here_vx.sh



# Extra 1. Autoboot into i3

Normally you end in a black screen where you are asked to give your login and password.

Since this computer is only used by me, I want to save some time in booting.

Remark: You can stop your computer afterwards with a shutdown command or via the start/stop button of your pc.


Following the article on 
https://wiki.archlinux.org/index.php/Automatic_login_to_virtual_console


    sudo systemctl edit getty@tty1

Type this content inside and CTRL +X to save.

    [Service]
    ExecStart=
    ExecStart=-/usr/bin/agetty --autologin username --noclear %I $TERM



# Extra 2. Gaps or no gaps 

Additional i3-gaps - not needed

You can not have i3 and i3-gaps.

It is a choice you have to make. You can take a look at the pictures above how it looks.



	./7_i3-with-gaps_v26.sh

Now open the file <b>config-gaps</b> and copy/paste these lines at the top of your own config file and change to your liking.

WIN + SHIFT + R to reload your new config file or reboot


# Extra 3. Firefox Well, this is embarrassing

Our computer stops so fast that Firefox thinks it crashed. 

So "stop firefox from saying well this is embarrasing"

Type in the url:

    about:config

Look for these two lines - just type in the first parts


    browser.sessionstore.resume_from_crash  from true to false

    browser.sessionstore.max_resumed_crashes from 0 to 1

# Extra 4. Matrix

This is just for fun. Matrix look.

    sudo pacman -S cmatrix

# Extra 5. Pacman.conf

You can have a little pacman showing when you download software.
Definitely fun.
Beware it is in a crucial file

Open /etc/pacman.conf
Find the options and add the text
ILoveCandy



# First use and tips

Follow some movies on youtube about i3 wm. That's the fastest way to learn.

Remember some important keyboard shortcuts

win + d = dmenu

shift + win + d = j4dmenu

ctrl + alt + a = xfce-appfinder

win + shift + e = exit i3

win + shift + r = reload config file

win + shift + q = closes any window

win + pause/break = let you suspend,hibernate, reboot and quit

All shortcuts are kept in one file : "config"
You do well to read this file.

lxappearance and qtconfig-qt4 are the first programs I use to change themes, fonts, icons.




<h2>Give it a go because <b> I 3 improved tiling </b> deserves to be more known.</h2>




# C O N C L U S I O N


I know that there are applications that seem 'out-of-place' in i3 but I like my working environment eye-candy. I admire for example the wallpapers creative people share with us. Through transparent terminals I will see them.

My background has been a variety of distro's. It is only natural I use a variety of programs from these distro's.

As for I3 you will need to be patient. I remember giving up a few times and somehow it challenged me to keep trying.

I am happy I persisted. 

<b>I3 is efficient.</b>

Advantages

    low memory consumption
    does not have many dependencies hence stabler
    keyboard driven
    software will be tiled automatically into two, three, four regions
    terminal is a WIN+ENTER away
    every program can get its own workspace
    switching between workspaces is easy and very practical
    have a backup environment to work if somehow your "other" desktop environment gets broken

 

Disadvantages

    takes time getting used to
    shortcuts to be remembered
    specific software to do things
    some terminal knowledge required


And remember if you start from this github, your learning curve will be much steeper and you will have the system up and running much faster.

Then you take it apart and write your own code.

------------------------------------
#But that is the fun in Linux.

You can do whatever <b>Y O U</b> want.

Share the knowledge.
------------------------------------





----------------------------------
#What can you do if the script does not execute?

Since I sometimes forget to make the script executable, I include here what you can do to solve that.

A script can only run when it is marked as an executable.

    ls -al 

Above code will reveal if a script has an "x". X meaning executable.
Google "chmod" and "execute" and you will find more info.

For now if this happens, you should apply this code in the terminal and add the file name.

    chmod +x typeyourfilename

Then you can execute it by typing

    ./typeyourfilename


# Antergos installation problems

If during installation cnchi gives you trouble.

From github :
From the ISO, close Cnchi and run this commands from a terminal:
    sudo pacman -S git
    sudo rm -rf /usr/share/cnchi
    git clone https://github.com/Antergos/cnchi --depth=1
    cd cnchi
    ./run﻿