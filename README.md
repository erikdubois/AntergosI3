# Antergos Base + i3 windows manager with gaps

# What can you achieve


![Screenshots](http://i.imgur.com/gvw6Uf7.jpg)


![Screenshots](http://i.imgur.com/MRH6EiB.jpg)


![Screenshots](http://i.imgur.com/2bMwqsl.jpg)


![Screenshots](http://i.imgur.com/UUw3NUM.jpg)


![Screenshots](http://i.imgur.com/N9sNc4m.jpg)


![Screenshots](http://i.imgur.com/DFdoVEE.jpg)


![Screenshots](http://i.imgur.com/wYxi8dI.jpg)


# Installation of Antergos Base and i3wm

We assume you know how to install Antergos Base from the usb/dvd. I have selected all possible options in the installer but one

    apache (nginx) + Mariadb + PHP was not selected

I used the application mintstick on Linux Mint or Antergos/Arch to burn an iso to an usb. 

https://www.youtube.com/watch?v=NvbRuIzYldU

This [article](http://erikdubois.be/install-linux-mint-18-1-cinnamon-customize/) also explains you how to burn an iso to an usb.

# I3wm

More info about i3wm can be found [here](https://i3wm.org/docs/userguide.html).


## Getting the installation files

You are left with a black screen and a prompt. This is your terminal or tty. Login with your password.

The idea is to download the i3 github files and start running the scripts, rather then typing the commmands by hand. In this manner you can build up your knowledge and perfect your scripts (and its fun to see it work). And next time you install Antergos I3 the installation will even go smoother.

    git clone https://github.com/erikdubois/Antergosi3.git

The **content** of this downloaded folder should be moved to a hidden folder in your home directory with the name  ~/.config/i3. 


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
 
    010-install-fastest-antergos-mirrors-vx.sh           (Antergos servers)
    020-install-fastest-arch-mirrors-vx                  (if you want the fastest servers)
    030-install-xorg-vx.sh                               (graphical environment needs xserver)
    040-install-packer-for-aur-make-build-v1             (packer is aur helper)
    050-install-i3-core-vx.sh                            (installing i3 with gaps)
    100-install-core-software-vx.sh                      (software from standard repositories)
    200-install-extra-software-vx.sh                     (software from AUR)
    300-install-themes-icons-cursors-conky-plank-vx.sh   (beautify your system)
    400-install-software-distro-specific-vx.sh           (specific software for i3wm)
    500-install-samba-vx.sh                              (if you want to share folder on your home network)
    600-install-personal-settings-vx.sh                  (necessary to be able to boot into i3 automatically)
    700-firefox-for-dark-themes-settings-vx.sh           (run this one after reboot - firefox must have run once)

Do not forget to type "./" in front of the name.

These scripts will point to some of the other scripts in the folder. So keep them together.

TIP: script 400 got errors from dabase lock... Not sure why. BUT the scripts are build that way that you can rerun it and none of the already installed software will be re-installed. A second run of 400 installed the remaining applications. You can do this with any of the scripts.

Some of the applications that will be installed are

    Spotify
    Sublime Text
    Variety
    Inkscape
    Plank
    Screenfetch
    ...

There are other scripts for more applications. If needed, you can install them individually.



##Setting i3 to autologin and autostart i3

I have automated this process in the script 600. 

**Read the script before executing.** 

It will also create folders if not present. You may want to delete some of those.

It will put all necessary files/commands in the right places (startx, xintrc,...)


    600-install-personal-settings-vx.sh                     (necessary to be able to boot into i3 automatically)



**You need to change the name in the file**

    installation/settings/autologin@.service

**to your own login name.**

You are normally in the directory "installation". Go inside the directory "settings"

    cd settings
    nano autologin@.service
    Look for the name "erik" and change it to your login
    CTRL+X to save your file


Because of these changes the $mod+shift+e will exit i3 but instantly log you back in. In essence it has become a relaunch i3 option and it is very fast. 

Exiting i3wm is done via $mod+Pause/Break and choosing the letters in the bottom bar. ($mod is windows or super key)
Shift+S is shutdown.





## Reboot

If you finished installing the scripts mentioned above then the magic can start.

    sudo reboot


***

# After rebooting


##Single or Dual monitor


I3wm is **ideal** for dual or more screens.

In the config file of i3 I declared the names of my monitors.
You can find out your names with

    xrandr
    arandr (graphical)

Uncomment or comment these lines.

    set $firstMonitor DVI-I-1
    set $secondMonitor DVI-I-2

There is also a script included that might help. This is to tell the system which screen should be on the left and which one on the right.

    dualscreen_autoset.sh

More info can be found on the official website of i3wm : https://i3wm.org/docs/userguide.html


## Firefox

I like the dark themes. But some of the websites (like youtube) give you unreadable inputboxes. After rebooting and starting firefox once (normally firefox is started on workspace 1), you can run script 700 to copy/paste the solution to the right place.




##Variety 

Script 600 will take care of that.

If you have transparent terminals and also if you use gaps in i3, it makes sense to have a wallpaper changer like variety.

You will have to edit one (or two) file(s) and delete some lines and you will have a GREAT working wallpaper with many sources but most importantly from desktopr.

Follow the dirty solution in my article :

http://erikdubois.be/how-to-make-variety-work-in-i3-windows-manager-linux-mint-17-3/

That will work on Antergos as well.

You can uncomment the feh line in the get_wallpaper as well.

More articles on [Variety.](http://erikdubois.be/variety)




##Change the theme

Changing themes should be done in i3wm with these two. 

    lxappearance and qtconfig-qt4.
 
 It is good to know the files can be manually edited if you run in problems.

    ~/.gtkrc-2.0                    (script 600)   
    ~/.config/gtk-3.0/settings.ini  (script 600)




##Install Arc Theme


Ofcourse you can install new themes. I like the **Arc** theme which I will use in the later screenshots. 

I install the **original blue** Arc theme but also my personally created Arc themes (see Arc Colora folder).

    install-gtk-arc-theme-git-vx.sh         (script 300)

Select your theme with **lxappearance**.



##Install your individual Arc Theme

You can change the blue accent colour from the Arc theme with these scripts to **any colour** you like : 

Read here for more info on Arc Based Themes : http://erikdubois.be/category/themes/arc-based-themes/

The contents of Arc Colora has been copied to your ~/.themes folder with script 600.

More info about [Arc Colora.](https://github.com/erikdubois/Arc-Theme-Colora)




##Download the Sardi icons

You can install the sardi icons via these scripts but they have been already installed via script 300.

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

They have been downloaded in script 300.

There is also a collection of **Sardi Extra** icons at 

https://github.com/erikdubois/Sardi-Extra

These icons can be downloaded but will not be maintained. Nor are they part of the core icons of Sardi. They are the result of ideas and scripts that are included in Sardi icons.

![Screenshots](http://i.imgur.com/sPo65Pi.jpg)

More documentation on http://erikdubois.be/category/sardi-icons/


##Download the Surfn icons

They have been downloaded in script 300.

For ease of installation I use the script

    - icons-surfn-vx.sh

You can also use

    - packer -S surfn-icons 
    - pacaur -S surfn-icons 
    - yaourt -S surfn-icons 


![Screenshots](http://i.imgur.com/BoacWMK.jpg)



More info can be found here : https://github.com/erikdubois/Surfn



##Install the Aureola conky collection

They have been downloaded in script 300. They do not run yet.


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




##Autoboot into i3 (alternative way - not implemented)

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

This works as well. Not implemented this time around.




##Change how pacman should work

Since this is a test pc I have included all **testing repo's**. Not recommended on a work pc.

You can get more [pacman info here.](https://wiki.archlinux.org/index.php/pacman)

I have choosen this time to go for these 'all out experimental' settings. 

    sudo subl3 /etc/pacman.conf

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


    [antergos-staging]
    SigLevel = PackageRequired
    Server = http://mirrors.antergos.com/$repo/$arch/

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

The file **/etc/pamac.conf** can be changed to your own liking. I am going for the following changes on my experimental pc.

    sudo subl3 /etc/pamac.conf

Command to open the file.

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

You can do so by installing grubcustomizer (see script) and using the graphical (gui) approach or via terminal.

Edit this file with a text-editor. I recommend sublime-text.

        sudo subl3 /etc/default/grub

It lets you save on restricted area's and asks the root password for it.

    /etc/default/grub

Change this line to the seconds you want to wait for booting up

    GRUB_TIMEOUT="1"

Run this command to update the grub parameters

    sudo grub-mkconfig  -o /boot/grub/grub.cfg

Read more [here about grub](https://wiki.archlinux.org/index.php/GRUB)



##Do you like to have a transparent gnome-terminal

If you like to have a transparent gnome-terminal all the time (compton takes care to make it transparent when the terminal is no longer active), you can run the script

    install-gnome-terminal-transparency-v1


![Screenshots](http://i.imgur.com/UNdAuEG.jpg)



##Change from bash to zsh in your terminal

I like bash but I prefer zsh with lots of different themes from oh-my-zsh to spice things up. So let us install that via this script.


    ./install-zsh-vx.sh


Do not forget to run this command line code manually to achieve zsh.

    chsh erik -s /bin/zsh               (change to your login name)


![Screenshots](http://i.imgur.com/kehYX70.jpg)



##Firefox saying "Well, this is embarrassing"

Our computer stops so fast that Firefox thinks it crashed. 

So "stop firefox from saying well this is embarrasing"

Type in the url:

    about:config

Look for these two lines - just type in the first parts


    browser.sessionstore.resume_from_crash  from true to false

    browser.sessionstore.max_resumed_crashes from 0 to 1



## If you are a Matrix fan

This is just for fun. Matrix look.

    sudo pacman -S cmatrix

## Mintstick

I have installed over 50+ linux distro's and in all cases I used the application Mintstick from Linux Mint 17,18 or 18.1.

It has never failed me. So I keep it around on my other distro's.

You have a script to install it. 

Run it with this command to format the usb

    mintstick -m format

or write an iso to the usb

    mintstick -m iso



# Youtube Resources


https://www.youtube.com/playlist?list=PLlloYVGq5pS4iLBVGkYnL4sqMmm08W5WT




# Resources


http://erikdubois.be/tag/i3/

http://erikdubois.be/category/linux/i3/

**Arch beginners guide**

https://wiki.archlinux.org/index.php/Installation_guide

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
    terminal is a $mod+ENTER away
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

$mod = windows key or super key

$mod + d = dmenu

$mod + shift + d = j4dmenu

$mod + shift + e = exit i3

$mod + shift + r = reload config file

$mod + shift + q = closes any window

$mod + pause/break = let you suspend,hibernate, reboot and quit

All shortcuts are kept in one file : "config"
You do well to read this file.

lxappearance is the first program I use to change themes, fonts, icons.






# F  A  Q
--------------------

#Keyboard issues

If you have selected the right option in the installation screens everything will be set. But sometimes things go wrong. For that reason I keep it in.

Since I am living in a part of the world where you have an azerty keyboard, I need to set mine from the start.

    sudo loadkeys be-latin1

Look online for [more info and more keyboards](https://wiki.archlinux.org/index.php/Keyboard_configuration_in_console)

    localectl list-keymaps | less



#Time issues

If you have selected the right option in the installation screens everything will be set. But sometimes things go wrong. For that reason I keep it in.

One installation was set as UTC. Type this command to put your computer in the right time zone.

    sudo ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime

With Tab completion (pressing TAB twice) you can easily find a suitable place on earth. Upon next boot it will be correct.

More info about [time setting](https://wiki.archlinux.org/index.php/time#Set_clock)


#Bluetooth issues

It is a the moment quite difficult to get Bose Comfort 35 Bluetooth to work on the many linux distributions.

This will work for me on Antergos.

Run the script

    bose-bluetooth-headset-vx.sh

Then reboot to be sure...

Select the bluetooth icon in the bottom right corner. We trust it is there because of the blueberry application.

Activate your bluetooth headphone till you here "Ready to pair".

Then press mod1 (windows) + D to go to our menu and look for this program. It has been installed.

    pavucontrol

Select everywhere the bose device and A2DP sink.

![Screenshots](http://i.imgur.com/ott5Pos.jpg)

![Screenshots](http://i.imgur.com/tT93Y06.png)

Play some music. Powerdown your bose headphone and restart it. 

You should have music now and it will autoconnect next time around. Just switch your headphone off and on again.


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