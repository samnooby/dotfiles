#The install script for Nooby's i3 arch setup

#Default values that are chosen if no flags are set
HOMEDIR="/home/$(logname)"
OLDDIR="$(pwd)/old"
INSTALLDIR="$(pwd)/new"
RESTORE=False
INSTALL=True
KEEP_OLD=False

#Gets all the flags from the command line
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
	-h | --help )
		echo "A install script for Nooby's archlinux i3 setup"
		echo "Flags: "
		echo "-h (--help) Get this help message"
		echo "-d (--dir) Change the home directory(default /home/$(logname))"
		echo "-r (--restore) Restore config before last install, only valid after installation has happened once"
		echo "-o (--old-dir) Change the directory that old config is saved to"
		echo "-n (--no-install) moves all appropriate files but does not install packages"
		echo "-k (--keep-old) Merges old config files in to keep some config settings"
		exit
		;;
	-d | --dir )
		shift; HOMEDIR=$1
		;;
	-r | --restore )
		RESTORE=True
		;;
	-o | --old-dir )
		shift; OLDDIR=$1
		;;
	-n | --no-install )
		INSTALL=False
		;;
	-k | --keep-old )
		echo "WARNING: MERGING OLD CONFIG FILES MAY CAUSE OLD CONFIG SETTINGS TO OVERRIDE NEW SETTINGS"
		KEEP_OLD=True
		;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

#Makes sure all required directories exist
if [[ ! -d $HOMEDIR ]]; then
	echo "Could not find $HOMEDIR"
	exit
elif [[ ! -d $OLDDIR ]]; then
	echo "Could not find $OLDDIR"
	exit
fi

#TODO: RESTORE OLD CONFIGS IF FLAG IS SET
if [[ $RESTORE == True ]]; then
	echo "Restoring configs from ${OLDDIR}"

	#Unlinks all files and moves them back from the old directory
	if [[ -d $OLDDIR/.config  ]]; then
		unlink $HOMEDIR/.config
		mv $OLDDIR/.config $HOMEDIR
	fi

	if [[ -f $OLDDIR/.bashrc ]]; then
		unlink $HOMEDIR/.bashrc
		mv $OLDDIR/.bashrc $HOMEDIR
	fi

	if [[ -f $OLDDIR/.xsession ]]; then
		unlink $HOMEDIR/.xsession
		mv $OLDDIR/.xsession $HOMEDIR
	fi

	if [[ -f $OLDDIR/.xbindkeysrc ]]; then
		unlink $HOMEDIR/.xbindkeysrc
		mv $OLDDIR/.xbindkeysrc $HOMEDIR
	fi

	if [[ -d $OLDDIR/fonts ]]; then
		unlink /usr/local/share/fonts
		mv $OLDDIR/fonts /usr/local/share/fonts
	fi

	if [[ -d $OLDDIR/backgrounds ]]; then
		unlink /usr/local/share/backgrounds
		mv $OLDDIR/backgrounds /usr/local/share/backgrounds
	fi

	unlink /usr/local/share/arch_logo.xpm

	if [[ -f $OLDDIR/Xresources ]]; then
		unlink /etc/X11/xdm/Xresources
		mv $OLDDIR/Xresources /etc/X11/xdm/Xresources
	fi

	if [[ -f $OLDDIR/Xsetup_0 ]]; then
		unlink /etc/X11/xdm/Xsetup_0
		mv $OLDDIR/Xsetup_0 /etc/X11/xdm/Xsetup_0
	fi

	if [[ -f $OLDDIR/.bash_profile ]]; then
		unlink $HOMEDIR/.bash_profile
		mv $OLDDIR/.bash_profile $HOMEDIR
	fi

	exit
fi

#Installs all pacman requirements, saves all old requirements to file
if [[ $INSTALL == True ]]; then
	echo "Installing pacman packages..."
	pacman -Qqen > $OLDDIR/requirements.txt
	pacman -S - < $INSTALLDIR/requirements.txt
fi

rm -rf $INSTALLDIR/.config
cp -rT $(pwd)/.config $INSTALLDIR/.config

# Installs config folder in home directory
if [[ -d $HOMEDIR/.config  ]]; then
	echo "Saving old config folder"
	# Removes old config folder1
	if [[ -d $OLDDIR/.config || -h $OLDDIR/.config  ]]; then
		rm -rf $OLDDIR/.config
	fi

	mv $HOMEDIR/.config $OLDDIR/

	# Merges config folders if flag given
	if [[ $KEEP_OLD == True ]]; then
		echo "Merging config files"
		cp -RT $OLDDIR/.config $INSTALLDIR/.config
	fi
fi

ln -s $INSTALLDIR/.config $HOMEDIR/.config

# Install the .bashrc
if [[ -f $HOMEDIR/.bashrc || -h $HOMEDIR/.bashrc ]]; then
	echo "Saving old .bashrc"
	mv $HOMEDIR/.bashrc $OLDDIR/.bashrc
fi

ln -s $INSTALLDIR/.bashrc $HOMEDIR/.bashrc

# Installs the .xsession
if [[ -f $HOMEDIR/.xsession || -h $HOMEDIR/.xsession ]]; then
	echo "Saving old .xsession"
	mv $HOMEDIR/.xsession $OLDDIR/.xsession
fi

ln -s $INSTALLDIR/.xsession $HOMEDIR/.xsession

# Installs the saved keybindings
if [[ -f $HOMEDIR/.xbindkeysrc || -h $HOMEDIR/.xbindkeysrc ]]; then
	echo "Saving old .xbindkeysrc"
	mv $HOMEDIR/.xbindkeysrc $OLDDIR/.xbindkeysrc
fi

ln -s $INSTALLDIR/.xbindkeysrc $HOMEDIR/.xbindkeysrc

# Installs the systems font
if [[ -d /usr/local/share/fonts ]]; then
	echo "Saving old fonts folder"
	# Removes old fonts folder
	if [[ -d $OLDDIR/fonts || -h $OLDDIR/fonts  ]]; then
		rm -rf $OLDDIR/fonts
	fi

	mv /usr/local/share/fonts $OLDDIR
fi

ln -s $INSTALLDIR/fonts /usr/local/share/fonts

# Installs the systems font
if [[ -d /usr/local/share/backgrounds ]]; then
	echo "Saving old backgrounds folder"
	# Removes old backgrounds folder
	if [[ -d $OLDDIR/backgrounds || -h $OLDDIR/backgrounds  ]]; then
		rm -rf $OLDDIR/backgrounds
	fi

	mv /usr/local/share/backgrounds $OLDDIR
fi

ln -s $INSTALLDIR/arch_logo.xpm /usr/local/share/arch_logo.xpm
ln -s $INSTALLDIR/backgrounds /usr/local/share/backgrounds

#Install XDM settings
if [[ -f /etc/X11/xdm/Xresources ]]; then
	echo "Saving old Xresources file"
	mv /etc/X11/xdm/Xresources $OLDDIR/Xresources
fi

ln -s $INSTALLDIR/Xresources /etc/X11/xdm/Xresources

if [[ -f /etc/X11/xdm/Xsetup_0 ]]; then
	echo "Saving old Xsetup_0 file"
	mv /etc/X11/xdm/Xsetup_0 $OLDDIR/Xsetup_0
fi

ln -s $INSTALLDIR/Xsetup_0 /etc/X11/xdm/Xsetup_0

#Installs the bash_profile
if [[ -f $HOMEDIR/.bash_profile ]]; then
	echo "Saving old .bash_profile"
	mv $HOMEDIR/.bash_profile $OLDDIR/.bash_profile
fi

ln -s $INSTALLDIR/.bash_profile $HOMEDIR/.bash_profile

chown -R $(logname) $INSTALLDIR
# systemctl enable --now xdm.service
