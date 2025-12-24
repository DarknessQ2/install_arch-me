#!/bin/bash
set -e

lsblk
read -rp "Disco (ej: /dev/sda): " DISK
read -rp "ESCRIBE BORRAR para continuar: " OK

[ "$OK" != "BORRAR" ] && exit 1

umount -R /mnt 2>/dev/null || true

wipefs -af "$DISK"

parted -s "$DISK" mklabel msdos
parted -s "$DISK" mkpart primary ext4 1MiB 100%

mkfs.ext4 -F "${DISK}1"

mount "${DISK}1" /mnt
