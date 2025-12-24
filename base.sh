#!/bin/bash
set -e

pacstrap /mnt \
base linux linux-firmware \
networkmanager \
sudo nano git \
grub os-prober \
pipewire pipewire-alsa pipewire-pulse pipewire-jack \
wireplumber \
pavucontrol \
mesa libdrm \
vulkan-intel \
xf86-video-intel \
hyprland wayland \
xdg-desktop-portal-hyprland \
kitty foot \
wlroots \
xdg-user-dirs

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash <<EOF

# Zona horaria
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc

# Locale
sed -i 's/#es_MX.UTF-8 UTF-8/es_MX.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=es_MX.UTF-8" > /etc/locale.conf

# Hostname
echo "archlinux" > /etc/hostname

# Red
systemctl enable NetworkManager

# Audio
systemctl enable pipewire pipewire-pulse wireplumber

# GRUB BIOS
grub-install --target=i386-pc $DISK
grub-mkconfig -o /boot/grub/grub.cfg

# Directorios usuario
xdg-user-dirs-update

EOF

