#!/usr/bin/bash

# Setup configuration files for Kali Linux

## Update the kali
sudo apt update && sudo apt upgrade -y

## Install all the programs need it
sudo apt install -y tmux vim lynx screenkey

## Copy basic files for terminal to their location
cp {.bashrc,.inputrc,.vimrc,.tmux.conf} ~/

## Create folder for lynx if it doesn't exists
if [[ ! -d ~/.config/lynx ]];then
	mkdir -p ~/.config/lynx
fi

# Create folder for binaries if it doesn't exists
if [[ ! -d ~/.local/bin ]]; then
	mkdir -p ~/.local/bin
fi

# Create folder for wallpapers if it doesn't exists
if [[ ! -d ~/Pictures/wallpapers ]]; then
	mkdir -p ~/Pictures/wallpapers
fi

## Copy lynx files
cp lynx.cfg lynx.lss ~/.config/lynx/
## Copy alias
cp aliasrc ~/.config/
## Copy wallpaper
cp AloneTalks.jpg ~/Pictures/wallpapers/
## Copy scripts
cp {sharekeys,lynx,bing,duck,google,vic,ix,urlencode,path} ~/.local/bin/
## Give them permissions
chmod u+x ~/.local/bin/*

# Change shell to bash
chsh -s /usr/bin/bash

# Set wallpaper
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s /home/kali/Pictures/wallpapers/AloneTalks.jpg

# Reboot and enjoy
reboot
