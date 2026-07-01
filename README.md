# ArchLinuxHyprland

My personal Arch Linux Hyprland setup script.

The goal is simple: after installing a minimal Arch Linux system, I can clone this repository and restore my complete desktop environment, applications, fonts, virtualization tools, themes, shell configuration, SDDM customization, and personal configurations with a single script.

## Requirements

Install Git and Base Development tools:

```bash
sudo pacman -Syu
sudo pacman -S base-devel git
```

## Clone the Repository

```bash
git clone https://github.com/RicardoDereste/ArchLinuxHyprland.git

cd ArchLinuxHyprland
```

## Run the Installer

Make the script executable:

```bash
chmod +x install.sh
```

Run the installer:

```bash
./install.sh
```

## What the Script Does

### Official Packages

Installs all required packages using Pacman.

#### Desktop Environment

- Hyprland
- Hyprlock
- Hypridle
- Hyprcursor
- Hyprpaper
- Hyprpicker
- Waybar
- Kitty
- Rofi
- Dolphin
- Dolphin Plugins
- Dunst
- SDDM

#### Multimedia

- PipeWire
- WirePlumber
- FFmpeg
- MPV
- Pavucontrol
- GStreamer plugins

#### Fonts

- JetBrains Mono Nerd Font
- Symbols Nerd Font Mono
- Font Awesome
- Noto Fonts
- Droid Fonts
- Roboto Fonts
- Open Sans

#### KDE Utilities

- Ark
- Kate
- KCalc
- KDE CLI Tools
- Polkit KDE Agent

#### Applications

- LibreOffice
- QBittorrent
- Steam
- Fastfetch
- Nano
- Htop
- Discover
- Flatpak

#### Virtualization

- QEMU Full
- Virt-Manager
- Virt-Viewer
- DNSMasq
- VDE2
- OpenBSD Netcat
- Libguestfs

#### SDDM Dependencies

- Qt6 SVG
- Qt6 Virtual Keyboard
- Qt6 Multimedia FFmpeg

## System Configuration

### NVidia

Adds the files:

- grub
- mkinitcpio.conf
- nvidia.hook

### PipeWire

Enables:

- PipeWire
- PipeWire Pulse
- WirePlumber

### Virtualization

Enables:

- libvirtd

Adds the current user to:

- libvirt group

### User Directories

Creates standard user folders:

- Downloads
- Documents
- Pictures
- Videos
- Music

### Display Manager

Enables:

- SDDM

### Flatpak

Adds the Flathub repository:

```text
https://flathub.org/repo/flathub.flatpakrepo
```

## AUR Packages

Installs Yay and the following packages:

- Brave Browser
- Visual Studio Code
- Hyprshot
- Waypaper
- Swww
- MPVPaper
- Wlogout
- QView
- Qt5ct KDE
- Qt6ct KDE
- SilentSDDM Theme

## Shell Configuration

The installer copies a custom Bash configuration that includes:

- Custom Arch Linux prompt
- Git branch integration
- Fastfetch on startup
- Personal aliases
- Personal shell settings

## Configuration Files

The installer automatically copies and overwrites all the configuration files.

## Repository Structure

```text
ArchLinuxHyprland/
├── install.sh
├── README.md
├── bashrc
├── gtkrc-2.0
├── hypr/
│   └── hyprland.lua
├── kitty/
│   ├── current-theme.conf
│   └── kitty.conf
├── waybar/
│   ├── config.jsonc
│   └── style.css
├── rofi/
│   ├── config.rasi
│   ├── powermenu.rasi
│   └── powermenu.sh
├── nvidia/
│   ├── grub
│   ├── mkinitcpio.conf
│   └── nvidia.hook
├── nwg-look/
│   └── config
├── gtk-3.0/
│   └── settings.ini
├── gtk-4.0/
│   ├── gtk.css
│   └── settings.ini
├── xsettingsd/
│   └── xsettingsd.conf
├── qt5ct/
│   └── qt5ct.conf
├── qt6ct/
│   └── qt6ct.conf
└── sddm/
    ├── sddm.conf
    ├── default.conf
    ├── ArchLinux.png
    └── ArchUser.png
```

## After Installation

Reboot the system:

```bash
reboot
```

## Notes

This is my personal Arch Linux setup and will continue to evolve over time.