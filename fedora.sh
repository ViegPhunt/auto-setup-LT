#!/usr/bin/bash

echo "WELCOME! Now we will customize Fedora Terminal"
echo "Created by VietPQ"

sudo dnf update -y

cd ~

echo "Download some terminal tool"
sudo dnf install -y perl-Image-ExifTool make tmux btop cmatrix cbonsai cowsay unzip curl wget dpkg fzf eza bat zoxide neovim python3 nodejs npm ripgrep stow python3-pwntools
git clone https://github.com/pipeseroni/pipes.sh.git
cd pipes.sh
sudo make install
cd ..
rm -rf pipes.sh

echo "Download pwndbg"
sudo dnf install gdb -y
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
sudo dnf install fastfetch -y

echo "Config Zsh"
sudo dnf install zsh -y

echo "Download file config"
git clone https://github.com/vietpq685/auto-setup-LT.git ~/setup
mv ~/setup/dotfiles ~/dotfiles
rm -rf setup
mv ~/dotfiles/fastfetch/.config/fastfetch/fedora.jsonc ~/dotfiles/fastfetch/.config/fastfetch/config.jsonc
git clone https://github.com/tmux-plugins/tpm ~/dotfiles/tmux/.tmux/plugins/tpm

echo "Stow"
cd dotfiles
stow fastfetch nvim poshthemes tmux zsh
cd ~

echo 'Change shell'
chsh -s /usr/bin/zsh
