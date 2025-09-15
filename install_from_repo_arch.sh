#! /bin/bash
cd home-usr

cp -rv ./ ~/

if [ -d ~/yay ]; then
   echo 'yay exists'
else
    echo "yay dosn't exist"
    cd ~/
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
fi

yay -Syu

cd ~/configs
