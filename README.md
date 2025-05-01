# Auto Setup Linux Terminal
This script automates setup my Linux Terminal

## Table of Contents
- [Necessary](#Necessary)
- [Visuals](#Visuals)
- [Installation](#Installation)

## Necessary
> [!IMPORTANT]
> Make sure you used **Nerd Fonts**

> [!IMPORTANT]
> Install a backup tool and create a system backup before using this script.

> [!NOTE]
> This script does not include package uninstallation, as some packages may have already been installed on your system by default. Creating a package uninstallation script could potentially affect your previous system.

## Visuals
### Screenshots
![screenshot](./demo_images/screenshot-1.png)


## Installation
### Arch Linux
```
sudo pacman -Syu --noconfirm
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"
```

### Ubuntu and Debian
```
sudo apt update && sudo apt upgrade -y
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/ubuntu.sh)"
```
