#!/bin/bash

echo    " "
echo    "|==|\\\    /||==||  || ||    || ||    ||   =====\\\    //=======   ||==||  || =====\\\    //" 
echo    "|  | \\\  //||  ||  || ||    || ||    ||   ||    \\\  // ||    \\\  ||  ||  || ||    \\\  //"
echo    "|  |  \\\// ||  ||  || ||    || \\\    //   ||     \\\//  ||     \\\ ||  ||  || ||     \\\//"
echo    "|  |   ++  ||  ||  || ||    ||  ++++++    ||====  ++   +++++++++ ||  ||  || ======= ++ "
echo    "|  |   ++  ||  ||  || ||    || //    \\\        || ++   ||     // ||  ||  || ||      ++"
echo    "|  +===++  ||  ||  || ||====|| ||    ||        || ++   ||    //  ||  ||  || ||      ++"
echo    "+=======|  ||  ||==|| ||====|| ||    ||   ======= ++   =======   ||  ||==|| ======= ++"
echo -e "Lynux Sydney\n"

echo -e "\nInstalling Dependencies...\n"
apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
echo -e "\nSetting up Cargo...\n"
apt-get install cargo
echo -e "\nInstalling Alacritty...\n"
cargo install alacritty

location=$(pwd)
whoami=$(whoami)

if (( $whoami == root ))
then
	echo -e "\nPlease enter your linux Username  \c"
	read usr
	export alacrity=/root/.cargo/bin/alacritty
	printf "export alacrity="/root/.cargo/bin/alacritty"" >> /home/$usr/.bashrc
else
	export alacrity=/root/.cargo/bin/alacritty
	printf "export alacrity="/root/.cargo/bin/alacritty"" >> /home/$whoami/.bashrc
fi

echo -e "\nFinishing...\n"

rm /usr/share/applications/alacritty.desktop
touch /usr/share/applications/alacritty.desktop
mkdir /usr/share/icons/Alacritty
cp $location/alacritty.svg /usr/share/icons/Alacritty/alacritty.svg

desktop=/usr/share/applications/alacritty.desktop

printf "[Desktop Entry]" > $desktop
printf "\nName=Alacritty" >> $desktop
printf  "\nIcon=/usr/share/icons/Alacritty/alacritty.svg" >> $desktop
printf "\nExec=alacritty" >> $desktop
printf "\nTerminal=false" >> $desktop
printf "\nType=Application" >> $desktop
printf "\nStartupNotify=true" >> $desktop
printf "Keywords=terminal;" >> $desktop

