#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
#sed -i '177s/.//' /etc/locale.gen
#sed -i '178s/.//' /etc/locale.gen
#sed -i '393s/.//' /etc/locale.gen
#sed -i '394s/.//' /etc/locale.gen
locale-gen
echo "LANG=pt_BR.utf-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S --needed grub networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools  base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils cups hplip alsa-utils pulseaudio bash-completion openssh rsync acpi acpi_call tlp openbsd-netcat iptables-nft ipset flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font

#grub-btrfs
#reflector bluez bluez-utils virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2

pacman -S --needed xorg-server xorg-xinit xorg-apps mesa
pacman -S --needed xf86-video-intel
# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=i386-pc /dev/sdX --recheck # replace sdx with your disk name, not the partition
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
#systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
#systemctl enable reflector.timer
#systemctl enable fstrim.timer
#systemctl enable libvirtd
#systemctl enable firewalld
systemctl enable acpid

useradd -m -g users -G wheel,storage,power -s /bin/bash jeronimo
echo jeronimo:password | chpasswd
#usermod -aG libvirt ermanno

echo "jeronimo ALL=(ALL) ALL" >> /etc/sudoers.d/jeronimo


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"




