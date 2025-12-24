#!/bin/bash
set -e

pacstrap /mnt base linux linux-firmware networkmanager grub os-prober sudo nano

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash <<EOF
ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
hwclock --systohc

sed -i 's/#es_MX.UTF-8 UTF-8/es_MX.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=es_MX.UTF-8" > /etc/locale.conf

echo "archlinux" > /etc/hostname

systemctl enable NetworkManager

grub-install --target=i386-pc $DISK
grub-mkconfig -o /boot/grub/grub.cfg
EOF
