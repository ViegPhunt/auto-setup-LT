# Auto Setup Linux Terminal
This script automates setup of my Linux Terminal

## Table of Contents
- [Preview](#preview)
  - [Screenshots](#screenshots)
- [Important Notes](#important-notes)
- [Installation](#installation)
  - [Arch Linux](#arch-linux)
  - [Ubuntu](#ubuntu)
- [Update Config](#update-config)
- [Dotfiles Repo](#dotfiles-repo)

## Preview
### Screenshots
![screenshot1](https://github.com/user-attachments/assets/ce1d7ef4-9edd-4ce7-8047-7c43e0dfc0d7)
![screenshot2](https://github.com/user-attachments/assets/bffcde8f-e0c6-4af8-a942-bcb0dc68007f)

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

## Update Config
```
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/update.sh)"
```

## Dotfiles Repo
This repo contains all my dotfiles: [`Dotfiles`](https://github.com/ViegPhunt/Dotfiles).

## Feedback
If you find this repo useful or have any suggestions, feel free to open an issue or submit a pull request.
