#!/bin/bash

if ! [ -d ~/.config ] ;then
	mkdir ~/.config
fi

# Copy repos
sudo cp -f config/*.repo /etc/yum.repos.d/

# Google chrome
sudo yum install -y google-chrome-stable

# Term
sudo yum install -y rxvt-unicode-256color-ml

# Bashrc
cp -f config/.bashrc ~/

# VIM
sudo yum install -y gvim vim
cp -f config/.vimrc  ~/

# Fcitx
sudo yum install fcitx-table-chinese fcitx-cloudpinyin fcitx-configtool -y

# FIXME: To do auto to Insatll Bundle

# Xinitrc
cp -f config/.Xresources ~/
xrdb ~/.Xresources

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
sudo rpm -ivh ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/X11:/QtDesktop/Fedora_19/x86_64/compton-0.1.0-1.1.x86_64.rpm
cp -rf config/awesome ~/.config/
chmod 755 ~/.xinitrc
sudo ln -s ~/.xinitrc /usr/bin/awesome-xinitrc
sudo sed -i 's/awesome$/awesome-xinitrc/g' /usr/share/xsessions/awesome.desktop

# Disable selinux
sudo sed -i 's/^SELINUX=.*$/SELINUX=disabled/g' /etc/sysconfig/selinux

echo "Please don't forget to Install Bundle"
