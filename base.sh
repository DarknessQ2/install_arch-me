#!/bin/bash
set -e

pacstrap /mnt \
base linux linux-firmware sudo networkmanager \
git fish flatpak pipewire pipewire-pulse wireplumber \
hyprland waybar kitty grim slurp wl-clipboard \
xdg-desktop-portal-hyprland pavucontrol

genfstab -U /mnt >> /mnt/etc/fstab

echo "root:root" | arch-chroot /mnt chpasswd

arch-chroot /mnt systemctl enable NetworkManager
