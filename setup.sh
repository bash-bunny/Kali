#!/usr/bin/bash

# Setup configuration files for Kali Linux

# Install all the programs need it
sudo apt install -y tmux vim lynx

# Cp files to their location
cp {.bashrc,.inputrc,.vimrc,.tmux.conf} ~/

## Create the folders if it doesn't exists
if [[ -f ~/.config/lynx ]];then
	mkdir -p ~/.config/lynx
fi

if [[ -f ~/.local/bin ]]; then
	mkdir -p ~/.local/bin
fi

## Cp the rest of the files to their location
cp lynx.cfg lynx.lss ~/.config/lynx/
cp {lynx,bing,duck,google,vic,ix,urlencode,path} ~/.local/bin/

# Change shell to bash
chsh -s /usr/bin/bash
