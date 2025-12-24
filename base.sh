#!/bin/bash
set -e

pacstrap /mnt \
base linux linux-firmware \
grub networkmanager \
pipewire pipewire-alsa pipewire-pulse wireplumber \
intel-ucode sof-firmware \
sudo nano neovim

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash << EOF
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc

sed -i 's/#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "arch" > /etc/hostname

systemctl enable NetworkManager
EOF

