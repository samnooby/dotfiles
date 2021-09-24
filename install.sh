ln -s .config/* $HOME/.config

cp .homefiles/.xinitrc $HOME
cp .homefiles/.vimrc $HOME
cp .homefiles/.xbindkeysrc $HOME
cp .homefiles/.Xauthority $HOME

chsh -s /usr/bin/fish
