#!/bin/bash
set -e

clear
echo "========================================="
echo " Instalador Arch + Caelestia (BIOS)"
echo "========================================="
echo

echo "APPS PACMAN:"
echo "• Hyprland"
echo "• Intel video integrado"
echo "• Audio PipeWire"
echo "• Kitty, mpvpaper, swww"
echo

echo "APPS FLATPAK:"
echo "• Discord, Firefox, Chrome"
echo "• Steam, PrismLauncher"
echo "• Krita, LibreOffice"
echo "• Dolphin, Sober"
echo

read -p "¿Instalar APPS PACMAN? (s/n): " PACMAN_APPS
read -p "¿Instalar APPS FLATPAK? (s/n): " FLATPAK_APPS

./disk.sh
./base.sh

if [[ "$PACMAN_APPS" =~ ^[sS]$ ]]; then
  ./pacman_apps.sh
fi

if [[ "$FLATPAK_APPS" =~ ^[sS]$ ]]; then
  ./user.sh
fi

echo
echo "✅ Instalación terminada. Reinicia."
