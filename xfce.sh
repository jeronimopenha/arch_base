#!/bin/bash

#sudo timedatectl set-ntp true
#sudo hwclock --systohc

#sudo reflector -c Switzerland -a 12 --sort rate --save /etc/pacman.d/mirrorlist

#sudo firewall-cmd --add-port=1025-65535/tcp --permanent
#sudo firewall-cmd --add-port=1025-65535/udp --permanent
#sudo firewall-cmd --reload

#git clone https://aur.archlinux.org/pikaur.git
#cd pikaur/
#makepkg -si
#--noconfirm

#pikaur -S --noconfirm system76-power
#sudo systemctl enable --now system76-power
#sudo system76-power graphics integrated
#pikaur -S --noconfirm gnome-shell-extension-system76-power-git
#pikaur -S --noconfirm auto-cpufreq
#sudo systemctl enable --now auto-cpufreq

sudo pacman -S xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings xfce4 xfce4-goodies firefox arc-gtk-theme arc-icon-theme  vlc
#simplescreenrecorder obs-studio

#sudo flatpak install -y spotify
#sudo flatpak install -y kdenlive

sudo systemctl enable lightdm
#/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
#sleep 5
#sudo reboot
