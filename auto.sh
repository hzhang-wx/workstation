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

# Git
sudo yum install -y git

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
	mkdir -p  ~/.vim/bundle
fi
if ! [ -d ~/.vim/bundle/vundle ]; then
	git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# Dropbox
sudo yum install -y  nautilus-extensions libgnome
sudo rpm -ivh https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-1.6.0-1.fedora.x86_64.rpm
dropbox start -i

# Awesome
sudo yum install -y feh 
sudo yum install -y cairo --setopt=protected_multilib=false
sudo yum install -y awesome
sudo yum install -y vicious
sudo rpm -ivh ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/X11:/QtDesktop/Fedora_19/x86_64/compton-0.1.0-1.1.x86_64.rpm
cp -rf config/awesome ~/.config/
chmod 755 ~/.xinitrc
sudo ln -s ~/.xinitrc /usr/bin/awesome-xinitrc
sudo sed -i 's/awesome$/awesome-xinitrc/g' /usr/share/xsessions/awesome.desktop

# Disable selinux
sudo sed -i 's/^SELINUX=.*$/SELINUX=disabled/g' /etc/sysconfig/selinux

# RunLevel
sudo ln -sf /usr/lib/systemd/system/multi-user.target /etc/systemd/system/default.target

# Misc
sudo yum install -y cscope

echo "Please don't forget to Install Bundle"
