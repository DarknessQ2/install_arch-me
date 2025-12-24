#!/bin/bash
set -e

USERNAME="luis"
PASSWORD="luis"

# ---- Todo esto corre DENTRO del sistema instalado ----
arch-chroot /mnt /bin/bash <<EOF

# Usuario
useradd -m -G wheel $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd

# Sudo (seguro, sin duplicar líneas)
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Paquetes base para usuario
pacman -S --noconfirm --needed \
git \
base-devel \
flatpak \
fish

# Flatpak repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

EOF

# ---- Instalar YAY como usuario ----
arch-chroot /mnt sudo -u "$USERNAME" bash <<EOF
cd /home/$USERNAME

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay
EOF

# ---- Apps AUR ----
arch-chroot /mnt sudo -u "$USERNAME" bash <<EOF
yay -S --noconfirm \
google-chrome \
github-desktop-bin \
ipscan-bin
EOF

# ---- Apps Flatpak ----
arch-chroot /mnt /bin/bash <<EOF
flatpak install -y flathub \
com.discordapp.Discord \
com.valvesoftware.Steam \
io.github.unknownskl.geforcenow-electron \
org.DolphinEmu.dolphin-emu \
org.prismlauncher.PrismLauncher \
org.vinegarhq.Sober
EOF

# ---- Caelestia ----
arch-chroot /mnt sudo -u "$USERNAME" bash <<EOF
git clone https://github.com/caelestia-dots/caelestia.git /home/$USERNAME/.local/share/caelestia
fish /home/$USERNAME/.local/share/caelestia/install.fish
EOF
