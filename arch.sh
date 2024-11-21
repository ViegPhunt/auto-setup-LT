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
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
rm -rf ~/yay
sudo pacman -S --noconfirm perl-image-exiftool make tmux btop cmatrix cowsay unzip curl wget dpkg fzf eza bat neovim
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

echo "Download gdb-gef"
sudo pacman -S gdb --noconfirm
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

echo "Download pokemon-colorscripts"
git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh
cd ..
rm -rf ~/pokemon-colorscripts

echo 'Download file config'
sudo wget https://github.com/vietpq685/auto-setup-LT/releases/latest/download/config.zshrc -O .zshrc
sudo chmod a+wx .zshrc
mkdir ~/.poshthemes
cd ~/.poshthemes
sudo wget https://github.com/vietpq685/auto-setup-LT/releases/latest/download/viet.omp.json -O viet.omp.json
sudo chmod a+wx viet.omp.json
mkdir -p ~/.config/fastfetch
cd ~/.config/fastfetch
sudo wget https://github.com/vietpq685/auto-setup-LT/releases/latest/download/arch.jsonc -O config.jsonc
sudo chmod a+wx config.jsonc
cd ~
sudo wget https://github.com/vietpq685/auto-setup-LT/releases/latest/download/config.tmux.conf -O .tmux.conf

echo "Config Oh-My-Posh"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

echo "Download Fastfetch"
sudo pacman -S fastfetch --noconfirm

echo "Config Tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Config Zsh"
sudo pacman -S zsh --noconfirm
chsh -s /usr/bin/zsh
