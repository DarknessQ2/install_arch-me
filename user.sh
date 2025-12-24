#!/bin/bash
set -e

USERNAME="luis"
PASSWORD="12345"

arch-chroot /mnt /bin/bash <<EOF
useradd -m -G wheel $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

pacman -S --noconfirm --needed \
base-devel \
git \
flatpak \
fish \
htop neofetch neovim \
wget curl fd fzf lf \
cava mangohud \
gparted \
udiskie \
terminus-font \
alsa-utils sof-firmware \
mesa-utils mpvpaper swww \
xarchiver file-roller ark \
firefox krita libreoffice-fresh \
network-manager-applet

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
EOF

# yay
arch-chroot /mnt sudo -u "$USERNAME" bash <<EOF
cd /home/$USERNAME
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
EOF

# AUR apps
arch-chroot /mnt sudo -u "$USERNAME" bash <<EOF
yay -S --noconfirm \
google-chrome \
github-desktop-bin \
ipscan-bin
EOF

# Flatpak apps
arch-chroot /mnt /bin/bash <<EOF
flatpak install -y flathub \
com.discordapp.Discord \
com.valvesoftware.Steam \
io.github.unknownskl.geforcenow-electron \
org.DolphinEmu.dolphin-emu \
org.prismlauncher.PrismLauncher \
org.vinegarhq.Sober
EOF

# Caelestia
arch-chroot /mnt sudo -u "$USERNAME" bash <<EOF
git clone https://github.com/caelestia-dots/caelestia.git /home/$USERNAME/.local/share/caelestia
fish /home/$USERNAME/.local/share/caelestia/install.fish
EOF
