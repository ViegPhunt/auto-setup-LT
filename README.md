# Auto Setup Linux Terminal
This script automates setup of my Linux Terminal

## Table of Contents
- [Auto Setup Linux Terminal](#auto-setup-linux-terminal)
  - [Table of Contents](#table-of-contents)
  - [Important Notes](#important-notes)
  - [Visuals](#demo)
    - [Screenshots](#screenshots)
  - [Installation](#installation)
    - [Arch Linux](#arch-linux)
    - [Ubuntu and Debian](#ubuntu-and-debian)

## Important Notes
> [!IMPORTANT]
> Make sure you used **Nerd Fonts**

> [!IMPORTANT]
> Install a backup tool and create a system backup before using this script.

> [!NOTE]
> This script does not include package uninstallation, as some packages may already exist on your system by default. Creating an uninstallation script could potentially affect your current setup.

> [!NOTE]
> This is my dotfiles repo: [`dotfiles`](https://github.com/ViegPhunt/Dotfiles)

## Demo
### Screenshots
![screenshot1](./demo_images/screenshot-1.png)
![screenshot2](./demo_images/screenshot-2.png)

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
