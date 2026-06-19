# ArchLinuxHyprland

My personal Arch Linux Hyprland setup script.

The goal is simple: after installing a minimal Arch Linux system, I can clone this repository and restore my complete desktop environment, applications, fonts, virtualization tools, themes, and personal configurations with a single script.

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

- QEMU
- Virt-Manager
- Virt-Viewer
- DNSMasq
- VDE2
- OpenBSD Netcat
- Libguestfs

## System Configuration

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

## Configuration Files

The installer automatically copies and overwrites the following configuration files.

### Hyprland

Source:

```text
hypr/hyprland.lua
```

Destination:

```text
~/.config/hypr/hyprland.lua
```

### Kitty

Source:

```text
kitty/current-theme.conf
kitty/kitty.conf
```

Destination:

```text
~/.config/kitty/
```

### Waybar

Source:

```text
waybar/config.jsonc
waybar/style.css
```

Destination:

```text
~/.config/waybar/
```

### NWG-Look

Source:

```text
nwg-look/config
```

Destination:

```text
~/.config/nwg-look/config
```

### GTK 2

Source:

```text
gtkrc-2.0
```

Destination:

```text
~/.gtkrc-2.0
```

### GTK 3

Source:

```text
gtk-3.0/settings.ini
```

Destination:

```text
~/.config/gtk-3.0/settings.ini
```

### GTK 4

Source:

```text
gtk-4.0/settings.ini
gtk-4.0/gtk.css
```

Destination:

```text
~/.config/gtk-4.0/
```

### XSettingsd

Source:

```text
xsettingsd/xsettingsd.conf
```

Destination:

```text
~/.config/xsettingsd/xsettingsd.conf
```

### Qt5ct

Source:

```text
qt5ct/qt5ct.conf
```

Destination:

```text
~/.config/qt5ct/qt5ct.conf
```

### Qt6ct

Source:

```text
qt6ct/qt6ct.conf
```

Destination:

```text
~/.config/qt6ct/qt6ct.conf
```

Existing files are overwritten automatically.

## Repository Structure

```text
ArchLinuxHyprland/
├── install.sh
├── README.md
├── gtkrc-2.0
├── hypr/
│   └── hyprland.lua
├── kitty/
│   ├── current-theme.conf
│   └── kitty.conf
├── waybar/
│   ├── config.jsonc
│   └── style.css
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
└── qt6ct/
    └── qt6ct.conf
```

## After Installation

Reboot the system:

```bash
reboot
```

## Notes

This is my personal Arch Linux setup and will continue to evolve over time.

Current version: 1.0
