# Antergos Base + i3 windows manager with gaps

We assume you know how to install Antergos Base from the usb/dvd. I have selected all possible options.


##Keyboard issues

Since I am living in a part of the world where you have an azerty keyboard, I need to set mine from the start.

    sudo loadkeys be-latin1

Look online for [more info and more keyboards](https://wiki.archlinux.org/index.php/Keyboard_configuration_in_console)



##Time issues

My time was set as UTC. Type this command to put your computer in the right time zone.

    sudo ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime

With Tab completion you can easily find a suitable place on earth. Upon next boot it will be correct.

More info about [time setting](https://wiki.archlinux.org/index.php/time#Set_clock)



## Getting the installation files

You are left with a black screen and a prompt. This is your terminal or tty.

The idea is to download the i3 github files and start running the scripts, rather then typing the commmand by hand. In this manner you can build up your knowledge. And next time you install Antergos I3 the installation will even go smoother.

    sudo pacman -S git
    git clone https://github.com/erikdubois/Antergosi3.git

The content of this folder should be copied to a hidden folder in your home directory with the name  ~/.config/i3. 


    ls                                    (list files/directories - look around)
    mv AntergosI3/ ~/.config/i3           (move)
    cd ~/.config/i3                       (change directory)
    ls
    cd installation                       (here are all the scripts)
    ls

This **installation** folder contains all the scripts you will ever need for your i3wm.


##Software installation

We start the installation scripts of all the needed software via the terminal **in the right order**.
Go inside the installation folder and run minimum these scripts. You can run the others once we are in a graphical environment.
 
    010-install-fastest-antergos-mirrors-vx.sh              (Antergos servers)
    020-install-fastest-mirrors-vx                          (if you want the fastest servers - change countries)
    030-install-xorg-vx.sh                                  (graphical environment needs xserver)
    040-install-packer-for-aur-make-build-v1                (packer is aur helper)
    050-install-i3-core-vx.sh                               (installing i3 with gaps)
    100-install-core-software-vx.sh                         (software from standard repositories)
    200-install-extra-software-vx.sh                        (software from AUR)
    300-install-themes-icons-cursors-conky-plank-vx.sh      (beautify your system)
    400-install-software-distro-specific-vx.sh              (specific software for i3wm)
    500-install-samba-vx.sh                                 (if you want to share folder on your home network)
    600-install-personal-settings-vx.sh                     (necessary to be able to boot into i3 automatically)

Do not forget to type "./" in front of the name.

These scripts will point to some of the other scripts in the folder. So keep them together.


Some of the applications that will be installed are

    Spotify
    Sublime Text
    Variety
    Inkscape
    Plank
    Screenfetch
    ...

There are other scripts for more applications. If needed, you can install them individually.



## setting i3 to start at boot

I have automated this process in the script 600. Read the script before executing. 
It will also create folders if not present. You may want to delete some of those.


    600-install-personal-settings-vx.sh                     (necessary to be able to boot into i3 automatically)



**You need to change the name in the file **

    installation/settings/autologin@.service

**to your own login name.**



##Change how pacman should work


You can get more info at https://wiki.archlinux.org/index.php/pacman.

I have choosen this time to go for these settings. 

Maybe you like "ILoveCandy" too.

    #
    # /etc/pacman.conf
    #
    # See the pacman.conf(5) manpage for option and repository directives

    #
    # GENERAL OPTIONS
    #
    [options]
    # The following paths are commented out with their default values listed.
    # If you wish to use different paths, uncomment and update the paths.
    #RootDir     = /
    #DBPath      = /var/lib/pacman/
    #CacheDir    = /var/cache/pacman/pkg/
    #LogFile     = /var/log/pacman.log
    #GPGDir      = /etc/pacman.d/gnupg/
    #HookDir     = /etc/pacman.d/hooks/
    HoldPkg     = pacman glibc
    #XferCommand = /usr/bin/curl -C - -f %u > %o
    #XferCommand = /usr/bin/wget --passive-ftp -c -O %o %u
    #CleanMethod = KeepInstalled
    #UseDelta    = 0.7
    Architecture = auto

    # Pacman won't upgrade packages listed in IgnorePkg and members of IgnoreGroup
    #IgnorePkg   =
    #IgnoreGroup =

    #NoUpgrade   =
    #NoExtract   =

    # Misc options
    UseSyslog
    Color
    TotalDownload
    CheckSpace
    VerbosePkgLists
    ILoveCandy

    # By default, pacman accepts packages signed by keys that its local keyring
    # trusts (see pacman-key and its man page), as well as unsigned packages.
    SigLevel    = Required DatabaseOptional
    LocalFileSigLevel = Optional
    #RemoteFileSigLevel = Required

    # NOTE: You must run `pacman-key --init` before first using pacman; the local
    # keyring can then be populated with the keys of all official Arch Linux
    # packagers with `pacman-key --populate archlinux`.

    #
    # REPOSITORIES
    #   - can be defined here or included from another file
    #   - pacman will search repositories in the order defined here
    #   - local/custom mirrors can be added here or in separate files
    #   - repositories listed first will take precedence when packages
    #     have identical names, regardless of version number
    #   - URLs will have $repo replaced by the name of the current repo
    #   - URLs will have $arch replaced by the name of the architecture
    #
    # Repository entries are of the format:
    #       [repo-name]
    #       Server = ServerName
    #       Include = IncludePath
    #
    # The header [repo-name] is crucial - it must be present and
    # uncommented to enable the repo.
    #

    # The testing repositories are disabled by default. To enable, uncomment the
    # repo name header and Include lines. You can add preferred servers immediately
    # after the header, and they will be used before the default mirrors.


    #[antergos-staging]
    #SigLevel = PackageRequired
    #Server = http://mirrors.antergos.com/$repo/$arch/

    [antergos]
    SigLevel = PackageRequired
    Include = /etc/pacman.d/antergos-mirrorlist

    [testing]
    Include = /etc/pacman.d/mirrorlist

    [core]
    Include = /etc/pacman.d/mirrorlist

    [extra]
    Include = /etc/pacman.d/mirrorlist

    [community-testing]
    Include = /etc/pacman.d/mirrorlist

    [community]
    Include = /etc/pacman.d/mirrorlist

    # If you want to run 32 bit applications on your x86_64 system,
    # enable the multilib repositories as required here.

    [multilib-testing]
    Include = /etc/pacman.d/mirrorlist

    [multilib]
    Include = /etc/pacman.d/mirrorlist

    # An example of a custom package repository.  See the pacman manpage for
    # tips on creating your own repositories.
    #[custom]
    #SigLevel = Optional TrustAll
    #Server = file:///home/custompkgs



##Change the settings of pamac to include also updates of AUR

The files /etc/pamac.conf can be changed to your own liking. I am going for the following changes

    ### Pamac configuration file

    ## When removing a package, also remove those dependencies
    ## that are not required by other packages (recurse option):
    RemoveUnrequiredDeps

    ## How often to check for updates, value in hours (0 to disable):
    RefreshPeriod = 6

    ## When there are no updates available, hide the tray icon:
    #NoUpdateHideIcon

    ## Allow Pamac to search and install packages from AUR:
    EnableAUR

    ## When AUR support is enabled search in AUR by default:
    #SearchInAURByDefault

    ## When AUR support is enabled check for updates from AUR:
    CheckAURUpdates

    ## Do not ask for confirmation when building packages:
    NoConfirmBuild


##Change grub to boot faster

Grub is waiting standard 5 seconds to boot... I want it to wait only 1 second.

You can do so by installing grubcustomizer and using the graphical (gui) approach or via terminal.

    /etc/default/grub

Change this line to the seconds you want to wait for booting up

    GRUB_TIMEOUT="1"

Run this command to update the grub parameters

    grub-mkconfig  -o /boot/grub/grub.cfg

Read more here : https://wiki.archlinux.org/index.php/GRUB


##Change the theme

Sometimes you can change the present theme to its dark equivalent. This is the case in Gnome/Budgie. 
In the gnome-tweak-tool you can change this. Here we will have to do this with 

    lxappearance and qtconfig-qt4.
    

##Install Arc Theme


Ofcourse you can install new themes. I like the **Arc** theme which I will use in the later screenshots. 

I install the **original blue** Arc theme but also my personally created Arc themes (see Arc Colora folder).

    install-gtk-arc-theme-vx.sh

##Install your individual Arc Theme

You can change the blue accent colour from the Arc theme with these scripts to **any colour** you like : 

Read here for more info on Arc Based Themes : http://erikdubois.be/category/themes/arc-based-themes/

More info about Arc Colora : https://github.com/erikdubois/Arc-Theme-Colora


##Download the Sardi icons

You can install the sardi icons via these scripts

    icons-sardi-vx.sh

This icon theme can be downloaded at sourceforge.

http://sourceforge.net/projects/sardi/

You can also use

    - packer -S sardi-icons 
    - pacaur -S sardi-icons 
    - yaourt -S sardi-icons 


![Screenshots](http://i.imgur.com/CUj0D3G.jpg)


Sardi is **meant to be changed by the users**. You can use scripts to change the hexadecimal colour code in about 3 seconds.


Start your reading about Sardi here : http://erikdubois.be/overview-sardi-icons-version-9-sardi-extra-icons/

Follow the collection on google+ : https://plus.google.com/u/0/collection/YFP-LB

The most recent pictures can be found there.

More documentation on http://erikdubois.be/category/sardi-icons/


##Download the Sardi-extra icons

There is also a collection of **Sardi Extra** icons at 

https://github.com/erikdubois/Sardi-Extra

These icons can be downloaded but will not be maintained. Nor are they part of the core icons of Sardi. They are the result of ideas and scripts that are included in Sardi icons.

![Screenshots](http://i.imgur.com/sPo65Pi.jpg)

More documentation on http://erikdubois.be/category/sardi-icons/


##Download the Surfn icons


For ease of installation I use the script

    - icons-surfn-vx.sh

You can also use

    - packer -S surfn-icons 
    - pacaur -S surfn-icons 
    - yaourt -S surfn-icons 


![Screenshots](http://i.imgur.com/BoacWMK.jpg)



More info can be found here : https://github.com/erikdubois/Surfn


##Install the Aureola conky collection


This is an exercise in writing conky configurations in lua syntax.


In above screenshots you can see the conky's at work.


More information can be found here : http://erikdubois.be/category/linux/aureola/


##Change the cursor


I like the breeze cursors.


    install-breeze-cursor-theme-v1

![Screenshots](http://i.imgur.com/wHp0I9s.png)

    
##Install the plank and download 100+ themes

NOT RELEVANT for i3wm. I leave it in for general information.

Plank is installed via the main scripts.

If you want to install 100+ plank themes, you need to run this script : 

    plank-themes-vx.sh

Find plank in the menu and start it. <b>CTRL + Right-click</b> on the plank and choose preferences
and put in on top. 

Surfn icons and all plank themes

![Screenshots](http://i.imgur.com/CRfb4Qo.gif)

Sardi icons and all plank themes

![Screenshots](http://i.imgur.com/dnmq1g0.gif)



Read more on plank e.g. how to autostart plank on boot : http://erikdubois.be/category/linux/plank/


##Change from bash to zsh in your terminal

I like bash but I prefer zsh with lots of different themes from oh-my-zsh to spice things up. So let us install that via this script.


    ./install-zsh-vx.sh


![Screenshots](http://i.imgur.com/kehYX70.jpg)


##Download this github for ease of installation

You can run any of these scripts by downloading the zip file from github. Go to the download folder and right-click to **Extract here**.
Go inside the folder and right-click <b>in a blank space</b> to go to the terminal. Now your terminal is opened in this extracted folder.

or 

copy/paste this command in your terminal.


    sudo pacman -S git
    git clone https://github.com/erikdubois/ArchBudgieI3





# Youtube Resources


https://www.youtube.com/playlist?list=PLlloYVGq5pS4iLBVGkYnL4sqMmm08W5WT



# Resources


**Sardi icons**

http://erikdubois.be/category/sardi-icons/

https://sourceforge.net/projects/sardi/files/

**Surfn icons**

https://github.com/erikdubois/Surfn

**Aureola conky**
    
http://erikdubois.be/category/linux/aureola/

https://github.com/erikdubois/Aureola

**Arc Colora**

http://erikdubois.be/category/themes/arc-based-themes/  

https://github.com/erikdubois/Arc-Theme-Colora

**Plank and 100+ Plank Themes**

http://erikdubois.be/category/linux/plank/

https://github.com/erikdubois/Plank-Themes




# C O N C L U S I O N

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

Then you take it the config apart and write your codes.




# First use and tips

Follow some movies on youtube about i3 wm. That's the fastest way to learn.

Remember some important keyboard shortcuts

win + d = dmenu

shift + win + d = j4dmenu

win + shift + e = exit i3

win + shift + r = reload config file

win + shift + q = closes any window

win + pause/break = let you suspend,hibernate, reboot and quit

All shortcuts are kept in one file : "config"
You do well to read this file.

lxappearance is the first program I use to change themes, fonts, icons.






# F  A  Q
--------------------

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

Or you can follow these steps

![Screenshots](http://i.imgur.com/vXsOaFL.gif)


-------------------------------------------------
#But that is the fun in Linux.

You can do whatever <b>Y O U</b> want.

Share the knowledge.

I share my knowledge at http://erikdubois.be
------------------------------------------------
























This is my configuration for I3 improved tiling to be used on Antergos.

https://antergos.com/

http://forum.antergos.com/

In the installation folder is all the data, explanations and scripts for you to have a great working environment but not directly a desktop environment.

I do not work with a display manager. Xorg and I3 provide all the display you will ever need.

I suggest you read up to better understand what a tiling window manager is.

It is really great once you have mastered the most important shortcuts.

https://i3wm.org/

# The latest screenshots

# What can you achieve?

![Screenshots](http://i.imgur.com/gvw6Uf7.jpg)


![Screenshots](http://i.imgur.com/MRH6EiB.jpg)


![Screenshots](http://i.imgur.com/2bMwqsl.jpg)


![Screenshots](http://i.imgur.com/UUw3NUM.jpg)


![Screenshots](http://i.imgur.com/N9sNc4m.jpg)


![Screenshots](http://i.imgur.com/DFdoVEE.jpg)


![Screenshots](http://i.imgur.com/wYxi8dI.jpg)



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

Add this line at the bottom


	KEYMAP=be-latin1

Save and exit with CTRL + X.


#3. Get the files from github

The idea is to download (if you have internet connection) the i3 github files. In my case I had internet connection straight after installing the base system and git was installed as well:

Git is NOT installed then
	
	sudo pacman -S git

Git is already installed then

	git clone https://github.com/erikdubois/antergosi3


no internet on lan, try these

    sudo systemctl enable dhcpcd
    sudo systemctl start dhcpcd



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

Gone to thunderbird now


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
<b>ILoveCandy</b>

If your internet connection is quite fast, you will hardly see it.



# First use and tips

Follow some movies on youtube about i3 wm. That's the fastest way to learn.

Remember some important keyboard shortcuts

win + d = dmenu

shift + win + d = j4dmenu

ctrl + alt + a = thunar

win + shift + e = exit i3

win + shift + r = reload config file

win + shift + q = closes any window

win + pause/break = let you suspend,hibernate, reboot and quit

All shortcuts are kept in one file : "config"
You do well to read this file.


<b>lxappearance and qtconfig-qt4 are the first programs I use to change themes, fonts, icons.</b>




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



# Antergos installation problems

If during installation cnchi gives you trouble.

From github :
From the ISO, close Cnchi and run this commands from a terminal:

    sudo pacman -S git
    sudo rm -rf /usr/share/cnchi
    git clone https://github.com/Antergos/cnchi --depth=1
    cd cnchi
    ./run﻿


# F  A  Q
--------------------

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

Or you can follow these steps

![Screenshots](http://i.imgur.com/vXsOaFL.gif)


-------------------------------------------------
#But that is the fun in Linux.

You can do whatever <b>Y O U</b> want.

Share the knowledge.

I share my knowledge at http://erikdubois.be
------------------------------------------------