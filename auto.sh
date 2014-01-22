#!/bin/bash

if ! [ -d ~/.config ] ;then
	mkdir ~/.config
fi

# Copy repos
cp -f config/*.repo /etc/yum.repos.d/

# Google chrome
sudo yum install -y google-chrome-stable

# Term
sudo yum install -y rxvt-unicode-256color-ml

# VIM
sudo yum install -y gvim
cp -f config/.vimrc  ~/

# FIXME: To do auto to Insatll Bundle

# Xinitrc
cp -f config/.Xresources ~/
cp -f config/.xinitrc ~/
if ! [ -d ~/.vim/bundle ]; then
	mkdir ~/.vim/bundle
fi
if ! [ -d ~/.vim/bundle/vundle ]; then
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
