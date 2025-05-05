# Auto Setup Linux Terminal
This script automates setup of my Linux Terminal

## Table of Contents
- [Necessary](#Necessary)
- [Visuals](#Visuals)
- [Installation](#Installation)
  - [Arch Linux](#Arch-Linux)
  - [Ubuntu and Debian](#Ubuntu-and-Debian)

## Important Notes
> [!IMPORTANT]
> Make sure you used **Nerd Fonts**

> [!IMPORTANT]
> Install a backup tool and create a system backup before using this script.

> [!NOTE]
> This script does not include package uninstallation, as some packages may already exist on your system by default. Creating an uninstallation script could potentially affect your current setup.

> [!NOTE]
> This is my dotfiles repo: [`dotfiles`](https://github.com/ViegPhunt/Dotfiles)

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
