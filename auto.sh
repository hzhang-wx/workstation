#!/bin/bash

if ! [ -d ~/.config ] ;then
	mkdir ~/.config
fi

# VIM
sudo yum install -y gvim
cp -f config/.vimrc  ~/

# FIXME: To do auto to Insatll Bundle

# Xinitrc
cp -f config/.Xresources ~/
cp -f config/.xinitrc ~/
if ! [ ~/.vim/bundle ]; then
	mkdir ~/.vim/bundle
fi
if ! [ ~/.vim/bundle/vundle ]; then
	git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# Awesome
sudo yum install -y feh 
sudo yum install -y cairo --setopt=protected_multilib=false
sudo yum install -y awesome
sudo yum install -y compton
cp -rf config/awesome ~/.config/
chmod 755 ~/.xinitrc
sudo ln -s ~/.xinitrc /usr/bin/awesome-xinitrc
sudo sed -i 's/awesome$/awesome-xinitrc/g' /usr/share/xsessions/awesome.desktop

echo "Please don't forget to Install Bundle"
