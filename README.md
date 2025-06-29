# Auto Setup Linux Terminal
This script automates setup of my Linux Terminal

## Table of Contents
- [Preview](#preview)
  - [Screenshots](#screenshots)
- [Important Notes](#important-notes)
- [Installation](#installation)
  - [Arch Linux](#arch-linux)
  - [Ubuntu](#ubuntu)
- [Dotfiles Repo](#dotfiles-repo)

## Preview
### Screenshots
![screenshot1](https://github.com/user-attachments/assets/4bd63580-aa3d-400e-9301-6c50b59ae8fb)
![screenshot2](https://github.com/user-attachments/assets/1014184d-f0b7-49bb-a6f7-dfdda9236d37)

## Important Notes
> [!IMPORTANT]
> Make sure you used **Nerd Fonts**

> [!IMPORTANT]
> Install a backup tool and create a system backup before using this script.

> [!NOTE]
> This script does not include package uninstallation, as some packages may already exist on your system by default. Creating an uninstallation script could potentially affect your current setup.

## Installation
### Arch Linux
```
sudo pacman -Syu --noconfirm
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"
```

### Ubuntu
```
sudo apt update && sudo apt upgrade -y
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/ubuntu.sh)"
```

## Dotfiles Repo
This repo contains all my dotfiles: [`Dotfiles`](https://github.com/ViegPhunt/Dotfiles).

## Feedback
If you find this repo useful or have any suggestions, feel free to open an issue or submit a pull request.
