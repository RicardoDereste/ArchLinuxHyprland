#!/bin/bash

set -e

echo "========================================"
echo "Installing official Arch Linux packages"
echo "========================================"

sudo pacman -S --noconfirm pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber gstreamer gst-libav gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly ffmpeg intel-media-driver libva-intel-driver mesa vulkan-intel vulkan-nouveau vulkan-radeon xf86-video-amdgpu xf86-video-ati xf86-video-nouveau alsa-utils sof-firmware alsa-firmware hyprland hyprlock hypridle hyprcursor hyprpaper hyprpicker waybar kitty rofi-wayland dolphin dolphin-plugins ark kio-admin polkit-kde-agent qt5-wayland qt6-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk dunst cliphist mpv pavucontrol xdg-user-dirs-gtk ttf-font-awesome ttf-jetbrains-mono-nerd ttf-opensans noto-fonts ttf-droid ttf-roboto fastfetch breeze breeze5 breeze-gtk papirus-icon-theme nwg-look kde-cli-tools archlinux-xdg-menu sddm nano firefox htop kate kcalc libreoffice-fresh qbittorrent steam qemu-full virt-manager virt-viewer dnsmasq vde2 openbsd-netcat libguestfs discover flatpak qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg linux-headers nvidia-open nvidia-utils lib32-nvidia-utils accountsservice

echo ""
echo "========================================"
echo "Enabling PipeWire services"
echo "========================================"

systemctl --user enable pipewire.service
systemctl --user enable pipewire-pulse.service
systemctl --user enable wireplumber.service

echo ""
echo "========================================"
echo "Enabling libvirtd services"
echo "========================================"

sudo systemctl enable --now libvirtd
sudo usermod -aG libvirt "${SUDO_USER:-$USER}"

echo ""
echo "========================================"
echo "Creating user directories"
echo "========================================"

xdg-user-dirs-update

echo ""
echo "========================================"
echo "Enabling SDDM"
echo "========================================"

sudo systemctl enable sddm.service

echo ""
echo "========================================"
echo "Adding Flathub repository"
echo "========================================"

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo ""
echo "========================================"
echo "Installing yay AUR helper"
echo "========================================"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

echo ""
echo "========================================"
echo "Installing AUR packages"
echo "========================================"

yay -S --noconfirm hyprshot wlogout qview visual-studio-code-bin brave-bin qt5ct-kde qt6ct-kde waypaper swww mpvpaper sddm-silent-theme

echo ""
echo "========================================"
echo "Installing .bashrc configuration"
echo "========================================"

cp -f bashrc ~/.bashrc

echo ""
echo "========================================"
echo "Installing Hyprland configuration"
echo "========================================"

mkdir -p ~/.config/hypr
cp -f hypr/hyprland.lua ~/.config/hypr/hyprland.lua

echo ""
echo "========================================"
echo "Installing Kitty configuration"
echo "========================================"

mkdir -p ~/.config/kitty
cp -f kitty/current-theme.conf ~/.config/kitty/current-theme.conf
cp -f kitty/kitty.conf ~/.config/kitty/kitty.conf

echo ""
echo "========================================"
echo "Installing Waybar configuration"
echo "========================================"

mkdir -p ~/.config/waybar
cp -f waybar/config.jsonc ~/.config/waybar/config.jsonc
cp -f waybar/style.css ~/.config/waybar/style.css

echo ""
echo "========================================"
echo "Installing rofi configuration"
echo "========================================"

mkdir -p ~/.config/rofi
cp -f rofi/config.rasi ~/.config/rofi/config.rasi
cp -f rofi/powermenu.rasi ~/.config/rofi/powermenu.rasi
cp -f rofi/powermenu.sh ~/.config/rofi/powermenu.sh
chmod +x ~/.config/rofi/powermenu.sh

echo ""
echo "========================================"
echo "Installing .gtkrc-2.0 configuration"
echo "========================================"

cp -f gtkrc-2.0 ~/.gtkrc-2.0

echo ""
echo "========================================"
echo "Installing nwg-look configuration"
echo "========================================"

mkdir -p ~/.config/nwg-look
cp -f nwg-look/config ~/.config/nwg-look/config

echo ""
echo "========================================"
echo "Installing GTK-3.0 configuration"
echo "========================================"

mkdir -p ~/.config/gtk-3.0
cp -f gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini

echo ""
echo "========================================"
echo "Installing GTK-4.0 configuration"
echo "========================================"

mkdir -p ~/.config/gtk-4.0
cp -f gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
cp -f gtk-4.0/settings.ini ~/.config/gtk-4.0/settings.ini

echo ""
echo "========================================"
echo "Installing xsettingsd configuration"
echo "========================================"

mkdir -p ~/.config/xsettingsd
cp -f xsettingsd/xsettingsd.conf ~/.config/xsettingsd/xsettingsd.conf

echo ""
echo "========================================"
echo "Installing qt5ct configuration"
echo "========================================"

mkdir -p ~/.config/qt5ct
cp -f qt5ct/qt5ct.conf ~/.config/qt5ct/qt5ct.conf

echo ""
echo "========================================"
echo "Installing qt6ct configuration"
echo "========================================"

mkdir -p ~/.config/qt6ct
cp -f qt6ct/qt6ct.conf ~/.config/qt6ct/qt6ct.conf

echo ""
echo "========================================"
echo "Installing nvidia configuration"
echo "========================================"

sudo cp -f nvidia/grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo cp -f nvidia/mkinitcpio.conf /etc/mkinitcpio.conf
sudo mkinitcpio -P
sudo mkdir -p /etc/pacman.d/hooks
sudo cp -f nvidia/nvidia.hook /etc/pacman.d/hooks/nvidia.hook

echo ""
echo "========================================"
echo "Installing SDDM configuration"
echo "========================================"

sudo cp -f sddm/sddm.conf /etc/sddm.conf
sudo cp -f sddm/ArchLinux.png /usr/share/sddm/themes/silent/backgrounds/
sudo cp -f sddm/default.conf /usr/share/sddm/themes/silent/configs/default.conf
sudo mkdir -p /var/lib/AccountsService/icons
sudo cp -f sddm/ArchUser.png /var/lib/AccountsService/icons/$USER
sudo mkdir -p /var/lib/AccountsService/users
sudo tee /var/lib/AccountsService/users/$USER > /dev/null <<EOF
[User]
Icon=/var/lib/AccountsService/icons/$USER
EOF

echo ""
echo "========================================"
echo "Installation completed successfully"
echo "========================================"
echo ""
echo "Please reboot your system."
echo ""
