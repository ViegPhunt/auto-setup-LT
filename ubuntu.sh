#!/usr/bin/bash

echo "WELCOME! Now we will customize Ubuntu Terminal"
echo "Created by VietPQ"

sudo apt update && sudo apt upgrade -y

cd ~

echo "Download some terminal tool"
sudo apt install -y exiftool make tmux btop cmatrix cbonsai cowsay unzip curl wget dpkg jq neovim
sudo wget $(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | jq -r '.assets[] | select(.name | test("bat-musl_.*amd64.deb")) | .browser_download_url') -O bat.deb
sudo dpkg -i bat.deb
rm -rf bat.deb
git clone --depth 1 https://github.com/junegunn/fzf.git
cd fzf
./install --bin
sudo mv ~/fzf/bin/fzf /usr/local/bin
cd ~
rm -rf fzf
git clone https://github.com/pipeseroni/pipes.sh.git
cd pipes.sh
sudo make install
cd ..
rm -rf pipes.sh

echo "Download gdb-gef"
sudo apt install gdb -y
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
sudo wget https://github.com/vietpq685/auto-setup-LT/releases/latest/download/ubuntu.jsonc -O config.jsonc
sudo chmod a+wx config.jsonc
cd ~
sudo wget https://github.com/vietpq685/auto-setup-LT/releases/latest/download/config.tmux.conf -O .tmux.conf

echo "Config Oh-My-Posh"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

echo "Download Fastfetch"
sudo wget https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb -O fastfetch.deb
sudo dpkg -i fastfetch.deb
rm -rf ~/fastfetch.deb

echo "Config Tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Config Zsh"
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
sudo apt install zsh -y
chsh -s /usr/bin/zsh
