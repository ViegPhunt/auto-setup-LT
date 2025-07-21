#!/usr/bin/env bash
set -euo pipefail

echo "==> WELCOME! Now we will customize Arch Terminal"
echo "==> Created by Phunt_Vieg_"

cd ~

echo "==> Updating system packages..."
sudo pacman -Syu --noconfirm


echo "==> Setting locale"
sudo sed -i '/^#en_US.UTF-8 UTF-8/s/^#//' /etc/locale.gen
sudo locale-gen
sudo localectl set-locale LANG=en_US.UTF-8

echo "==> Download some terminal tool"
sudo pacman -S --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
rm -rf ~/yay

pacman_packages=(
    # System monitoring and fun terminal visuals
    btop cmatrix cowsay fastfetch

    # Essential utilities
    make curl wget unzip dpkg fzf eza bat zoxide neovim tmux ripgrep fd stow man openssh netcat

    # CTF tools
    perl-image-exiftool gdb ascii

    # Programming languages
    python3 python-pip nodejs npm

    # Shell & customization
    zsh
)
aur_packages=(
    # System monitoring and fun terminal visuals
    cbonsai pipes.sh pokemon-colorscripts-git oh-my-posh
)
sudo pacman -S --noconfirm "${pacman_packages[@]}"
yay -S --noconfirm "${aur_packages[@]}"

echo "==> Allow pip3 install by removing EXTERNALLY-MANAGED file"
sudo rm -rf $(python3 -c "import sys; print(f'/usr/lib/python{sys.version_info.major}.{sys.version_info.minor}/EXTERNALLY-MANAGED')")

echo "==> Download pwndbg and pwntools"
git clone --depth=1 https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ..
pip3 install pwntools

echo "==> Download file config"
git clone --depth=1 https://github.com/ViegPhunt/Dotfiles.git ~/dotfiles
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm

echo "==> Stow"
cd ~/dotfiles
rm -rf .git README.md
stow -t ~ .
cd ~

echo "==> Change shell"
ZSH_PATH="$(which zsh)"
grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells
chsh -s "$ZSH_PATH"


echo
echo "==> Done!!! Please restart terminal."
echo
