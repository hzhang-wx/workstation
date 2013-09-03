#!/bin/bash

if ! [ -d ~/.config ] ;then
	mkdir ~/.config
fi

# VIM
yum install -y gvim
cp -f config/.vimrc  ~/

# FIXME: To do auto to Insatll Bundle

# Xinitrc
cp -f config/.Xresources ~/
cp -f config/.xinitrc ~/
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# Awesome
yum install -y feh 
yum install -y cairo
yum install -y awesome
yum install -y compton
cp -rf config/awesome ~/.config/
chmod 755 ~/.xinitrc
sudo ln -s ~/.xinitrc /usr/bin/awesome-xinitrc
sudo sed -i 's/awesome/awesome-xinitrc/g'

echo "Please don't forget to Install Bundle"
