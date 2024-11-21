#!/usr/bin/bash

echo "WELCOME! Now we will customize Fedora Terminal"
echo "Created by VietPQ"

sudo dnf update -y

cd ~

echo "Download some terminal tool"
sudo dnf install -y perl-Image-ExifTool make tmux btop cmatrix cbonsai cowsay unzip curl wget dpkg fzf eza bat neovim
git clone https://github.com/pipeseroni/pipes.sh.git
cd pipes.sh
sudo make install
cd ..
rm -rf pipes.sh

echo "Download gdb-gef"
sudo dnf install gdb -y
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
sudo wget https://github.com/vietpq685/auto-setup-LT/releases/latest/download/fedora.jsonc -O config.jsonc
sudo chmod a+wx config.jsonc
cd ~
sudo wget https://github.com/vietpq685/auto-setup-LT/releases/latest/download/config.tmux.conf -O .tmux.conf
sudo chmod a+wx .tmux.conf

echo "Config Oh-My-Posh"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

echo "Download Fastfetch"
sudo dnf install fastfetch -y

echo "Config Tmux"
echo "Go into Tmux and use ctrl+b and ctrl+shift+i to apply plugins"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Config Zsh"
sudo dnf install zsh -y
chsh -s /usr/bin/zsh
