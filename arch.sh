#!/bin/bash

echo "WELCOME! Now we will customize Arch Terminal"
echo "Created by Phunt_Vieg_"

sudo pacman -Syu --noconfirm

cd ~

echo 'Setting locale'
echo "en_US.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
sudo locale-gen
echo "LANG=en_US.UTF-8" | sudo tee -a /etc/locale.conf
export LANG=en_US.UTF-8

echo "Download some terminal tool"
sudo pacman -S --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
rm -rf ~/yay
sudo pacman -S --noconfirm perl-image-exiftool make tmux btop cmatrix cowsay unzip curl wget dpkg fzf eza bat zoxide neovim python3 python-pip nodejs npm ripgrep netcat stow man openssh
git clone --depth 1 https://gitlab.com/jallbrit/cbonsai
cd cbonsai
sudo make install
cd ..
rm -rf cbonsai
git clone --depth 1 https://github.com/pipeseroni/pipes.sh.git
cd pipes.sh
sudo make install
cd ..
rm -rf pipes.sh

echo "Allow pip3 install by removing EXTERNALLY-MANAGED file"
sudo rm -rf $(python3 -c "import sys; print(f'/usr/lib/python{sys.version_info.major}.{sys.version_info.minor}/EXTERNALLY-MANAGED')")

echo "Download pwndbg and pwntools"
sudo pacman -S gdb --noconfirm
git clone --depth 1 https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ..
pip3 install pwntools

echo "Download pokemon-colorscripts"
git clone --depth 1 https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh
cd ..
rm -rf ~/pokemon-colorscripts

echo "Config Oh-My-Posh"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

echo "Download Fastfetch"
sudo pacman -S fastfetch --noconfirm

echo "Config Zsh"
sudo pacman -S zsh --noconfirm

echo "Download file config"
git clone --depth 1 https://github.com/ViegPhunt/Dotfiles.git ~/dotfiles
mv ~/dotfiles/.config/fastfetch/arch.jsonc ~/dotfiles/.config/fastfetch/config.jsonc
git clone --depth 1 https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm

echo "Stow"
cd ~/dotfiles
rm -rf .git README.md
stow -t ~ .
cd ~

echo 'Change shell'
chsh -s /usr/bin/zsh
