#!/bin/bash
set -e

DISK=$(cat /mnt/.disk)

pacstrap /mnt \
base linux linux-firmware intel-ucode \
networkmanager \
sudo nano git \
grub os-prober \
pipewire pipewire-alsa pipewire-pulse pipewire-jack \
wireplumber pavucontrol \
mesa libdrm xf86-video-intel libva-utils \
hyprland wayland wlroots xdg-desktop-portal-hyprland \
kitty foot \
xdg-user-dirs \
bluez-utils \
ufw \
zram-generator

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash <<EOF
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc

sed -i 's/#es_MX.UTF-8 UTF-8/es_MX.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=es_MX.UTF-8" > /etc/locale.conf

echo "archlinux" > /etc/hostname

systemctl enable NetworkManager
systemctl enable pipewire pipewire-pulse wireplumber
systemctl enable bluetooth
systemctl enable ufw

grub-install --target=i386-pc $DISK
grub-mkconfig -o /boot/grub/grub.cfg

xdg-user-dirs-update
EOF

