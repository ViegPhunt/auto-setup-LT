#!/usr/bin/bash

echo "WELCOME! Now we will customize Arch Terminal"
echo "Created by VietPQ"

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
sudo pacman -S --noconfirm perl-image-exiftool make tmux btop cmatrix cowsay unzip curl wget dpkg fzf eza bat zoxide neovim python3 nodejs npm ripgrep netcat stow man openssh
git clone https://gitlab.com/jallbrit/cbonsai
cd cbonsai
sudo make install
cd ..
rm -rf cbonsai
git clone https://github.com/pipeseroni/pipes.sh.git
cd pipes.sh
sudo make install
cd ..
rm -rf pipes.sh

echo "Download pwndbg"
sudo pacman -S gdb --noconfirm
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ..

echo "Download pokemon-colorscripts"
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
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
git clone https://github.com/vietpq685/auto-setup-LT.git ~/setup
mv ~/setup/dotfiles ~/dotfiles
rm -rf setup
mv ~/dotfiles/fastfetch/.config/fastfetch/arch.jsonc ~/dotfiles/fastfetch/.config/fastfetch/config.jsonc
git clone https://github.com/tmux-plugins/tpm ~/dotfiles/tmux/.tmux/plugins/tpm

echo "Stow"
cd dotfiles
stow fastfetch nvim poshthemes tmux zsh
cd ~

echo 'Change shell'
chsh -s /usr/bin/zsh
