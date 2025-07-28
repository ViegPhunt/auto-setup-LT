# Auto Setup Linux Terminal
A simple script to automate the setup of my personalized Linux terminal environment.

## Table of Contents
- [Preview](#preview)
	- [Screenshots](#screenshots)
- [Important Notes](#important-notes)
- [Installation](#installation)
	- [Arch-based Distributions](#arch-based-distributions)
	- [Debian-based Distributions](#debian-based-distributions)
- [Dotfiles Repo](#dotfiles-repo)
- [Feedback](#feedback)

## Preview
### Screenshots
![screenshot1](https://github.com/user-attachments/assets/feaef7fc-3464-41c7-a9b5-fd2883c4290e)
![screenshot2](https://github.com/user-attachments/assets/20f92535-983f-4f3d-9772-5f79ced80a54)

## Important Notes
> [!IMPORTANT]
> Make sure you used **Nerd Fonts**

> [!IMPORTANT]
> Install a backup tool and create a system backup before using this script.

> [!NOTE]
> This script does not include package uninstallation, as some packages may already exist on your system by default. Creating an uninstallation script could potentially affect your current setup.

## Installation
### Arch-based Distributions
*Example: Arch Linux, EndeavourOS, Manjaro, etc.*
```
sudo pacman -Syu --noconfirm
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"
```

### Debian-based Distributions
*Example: Ubuntu, Kali Linux, Linux Mint, etc.*
```
sudo apt update && sudo apt upgrade -y
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/debian.sh)"
```

## Dotfiles Repo
This repo contains all my dotfiles: [`Dotfiles`](https://github.com/ViegPhunt/Dotfiles).

## Feedback
If you find this repo useful or have any suggestions, feel free to open an issue or submit a pull request.