#!/bin/bash
set -e

arch-chroot /mnt /bin/bash << 'EOF'
useradd -m luis
echo "luis:luis" | chpasswd
usermod -aG wheel luis

echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
chmod 440 /etc/sudoers.d/wheel

pacman -S --noconfirm git flatpak fish

su - luis << 'EOT'
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..

flatpak remote-add --if-not-exists flathub \
https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub \
com.discordapp.Discord \
org.mozilla.firefox \
com.google.Chrome \
com.valvesoftware.Steam \
org.prismlauncher.PrismLauncher \
org.kde.krita \
org.libreoffice.LibreOffice \
org.DolphinEmu.dolphin-emu \
org.vinegarhq.Sober

git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
fish ~/.local/share/caelestia/install.fish
EOT
EOF
