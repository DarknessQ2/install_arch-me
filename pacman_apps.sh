#!/bin/bash
set -e

DISK=$(cat /mnt/.disk)

arch-chroot /mnt /bin/bash << EOF
pacman -S --noconfirm \
hyprland xdg-desktop-portal-hyprland \
mesa xf86-video-intel libva-utils mesa-utils \
kitty htop ufw bluez bluez-utils \
mpvpaper swww pavucontrol

systemctl enable bluetooth
systemctl enable ufw

grub-install --target=i386-pc $DISK
grub-mkconfig -o /boot/grub/grub.cfg
EOF
