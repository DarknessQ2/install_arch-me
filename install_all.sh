#!/bin/bash
set -e

echo "=== INSTALADOR ARCH + CAELESTIA ==="

bash disk.sh
bash base.sh

echo "== Entrando al sistema instalado =="
arch-chroot /mnt /root/user.sh
