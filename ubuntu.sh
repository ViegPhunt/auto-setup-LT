#!/bin/bash

echo "==> WELCOME! Now we will customize Ubuntu Terminal"
echo "==> Created by Phunt_Vieg_"

cd ~

echo "==> Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "==> Download some terminal tool"
sudo apt install -y exiftool make tmux btop cmatrix cbonsai cowsay unzip curl wget dpkg eza jq zoxide python3 python3-pip nodejs npm ripgrep stow
sudo wget $(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | jq -r '.assets[] | select(.name | test("bat_.*amd64.deb")) | .browser_download_url') -O bat.deb
sudo dpkg -i bat.deb
rm -rf bat.deb
git clone --depth 1 https://github.com/junegunn/fzf.git
cd fzf
./install --bin
sudo mv ~/fzf/bin/fzf /usr/local/bin
cd ~
rm -rf fzf
git clone --depth 1 https://github.com/pipeseroni/pipes.sh.git
cd pipes.sh
sudo make install
cd ..
rm -rf pipes.sh

echo "==> Install neovim"
cd ~
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

echo "==> Allow pip3 install by removing EXTERNALLY-MANAGED file"
sudo rm -rf $(python3 -c "import sys; print(f'/usr/lib/python{sys.version_info.major}.{sys.version_info.minor}/EXTERNALLY-MANAGED')")

echo "==> Download pwndbg and pwntools"
sudo apt install gdb -y
git clone --depth 1 https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ..
pip3 install pwntools

echo "==> Download pokemon-colorscripts"
git clone --depth 1 https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh
cd ..
rm -rf ~/pokemon-colorscripts

echo "==> Config Oh-My-Posh"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

echo "==> Download Fastfetch"
sudo wget https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb -O fastfetch.deb
sudo dpkg -i fastfetch.deb
rm -rf ~/fastfetch.deb

echo "==> Config Zsh"
sudo apt install zsh -y

echo "==> Download file config"
git clone --depth 1 https://github.com/ViegPhunt/Dotfiles.git ~/dotfiles
mv ~/dotfiles/.config/fastfetch/ubuntu.jsonc ~/dotfiles/.config/fastfetch/config.jsonc
git clone --depth 1 https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm

echo "==> Stow"
cd ~/dotfiles
rm -rf .git README.md
stow -t ~ .
cd ~

echo "==> Change shell"
chsh -s /usr/bin/zsh
exec zsh
