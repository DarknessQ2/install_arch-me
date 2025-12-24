#!/bin/bash
set -e

lsblk
read -p "Disco (ej: /dev/sda): " DISK
read -p "ESCRIBE BORRAR para continuar: " OK

[ "$OK" != "BORRAR" ] && exit 1

parted -s "$DISK" mklabel msdos
parted -s "$DISK" mkpart primary ext4 1MiB 100%
parted -s "$DISK" set 1 boot on

mkfs.ext4 "${DISK}1"

mount "${DISK}1" /mnt

echo "$DISK" > /mnt/.disk
