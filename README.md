# ArchLinuxHyprland

My personal Arch Linux Hyprland setup script.

The goal is simple: after installing a minimal Arch Linux system, I can clone this repository and restore my complete desktop environment, applications, fonts, virtualization tools, and personal configurations with a single script.

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

Installs all required packages using Pacman, including:

#### Desktop Environment

- Hyprland
- Hyprlock
- Hypridle
- Hyprpaper
- Hyprpicker
- Waybar
- Kitty
- Rofi
- Dolphin
- Dunst

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

- Dolphin Plugins
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

### PipeWire Configuration

Enables:

- PipeWire
- PipeWire Pulse
- WirePlumber

### Virtualization Configuration

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

### AUR Packages

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

### Hyprland

Copies:

```text
hypr/hyprland.lua
```

To:

```text
~/.config/hypr/hyprland.lua
```

### Kitty

Copies:

```text
kitty/current-theme.conf
kitty/kitty.conf
```

To:

```text
~/.config/kitty/
```

### Waybar

Copies:

```text
waybar/config.jsonc
waybar/style.css
```

To:

```text
~/.config/waybar/
```

Existing files are overwritten automatically.

## Repository Structure

```text
ArchLinuxHyprland/
├── install.sh
├── README.md
├── hypr/
│   └── hyprland.lua
├── kitty/
│   ├── current-theme.conf
│   └── kitty.conf
└── waybar/
    ├── config.jsonc
    └── style.css
```

## After Installation

Reboot the system:

```bash
reboot
```

## Notes

This is my personal Arch Linux setup and will continue to evolve over time.

Current version: 1.0
