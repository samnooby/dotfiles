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

	exit
fi

#Installs all pacman requirements, saves all old requirements to file
if [[ $INSTALL == True ]]; then
	pacman -Qqen > $OLDDIR/requirements.txt
	pacman -S - < $INSTALLDIR/requirements.txt
fi

rm -rf $INSTALLDIR/.config
cp -rT $(pwd)/.config $INSTALLDIR/.config

#Installs all the files and saves all old configs to the olddir
if [[ -d $HOMEDIR/.config  ]]; then
	echo "Saving old .config folder"
	if [[ -d $OLDDIR/.config || -h $OLDDIR/.config  ]]; then
		echo "Removing saved old config file"
		rm -rf $OLDDIR/.config
	fi
	mv $HOMEDIR/.config $OLDDIR/
	if [[ $KEEP_OLD == True ]]; then
		echo "Merging config folder"
		cp -RT $OLDDIR/.config $INSTALLDIR/.config
	fi
fi

if [[ -f $HOMEDIR/.bashrc || -h $HOMEDIR/.bashrc ]]; then
	echo "Saving old .bashrc"
	mv $HOMEDIR/.bashrc $OLDDIR/.bashrc
fi

if [[ -f $HOMEDIR/.xsession || -h $HOMEDIR/.xsession ]]; then
	echo "Saving old .xsession"
	mv $HOMEDIR/.xsession $OLDDIR/.xsession
fi

ln -s $INSTALLDIR/.config $HOMEDIR/.config
ln -s $INSTALLDIR/.bashrc $HOMEDIR/.bashrc
ln -s $INSTALLDIR/.xsession $HOMEDIR/.xsession

# systemctl enable --now xdm.service
