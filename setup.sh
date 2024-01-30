#!/usr/bin/bash

# Setup configuration files for Kali Linux

## Update the kali
sudo apt update && sudo apt upgrade -y

## Install all the programs need it
sudo apt install -y tmux vim lynx screenkey

## Copy basic files for terminal to their location
cp {.bashrc,.inputrc,.vimrc,.tmux.conf} ~/

## Create the folders if it doesn't exists
if [[ ! -d ~/.config/lynx ]];then
	mkdir -p ~/.config/lynx
fi

if [[ ! -d ~/.local/bin ]]; then
	mkdir -p ~/.local/bin
fi

## Copy lynx files
cp lynx.cfg lynx.lss ~/.config/lynx/
## Copy alias
cp aliasrc ~/.config/
## Copy scripts
cp {sharekeys,lynx,bing,duck,google,vic,ix,urlencode,path} ~/.local/bin/
## Give them permissions
chmod u+x ~/.local/bin/*

# Change shell to bash
chsh -s /usr/bin/bash

# Reboot and enjoy
reboot
