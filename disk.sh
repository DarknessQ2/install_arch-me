#!/bin/bash
set -e

lsblk
read -p "Disco (ej: /dev/nvme0n1): " DISK
read -p "ESCRIBE BORRAR para continuar: " OK

[ "$OK" != "BORRAR" ] && exit 1

parted -s $DISK mklabel gpt
parted -s $DISK mkpart EFI fat32 1MiB 513MiB
parted -s $DISK set 1 esp on
parted -s $DISK mkpart ROOT ext4 513MiB 100%

mkfs.fat -F32 ${DISK}1
mkfs.ext4 ${DISK}2

mount ${DISK}2 /mnt
mkdir -p /mnt/boot
mount ${DISK}1 /mnt/boot
