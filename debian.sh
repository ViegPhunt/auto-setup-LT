#!/usr/bin/env bash
set -euo pipefail

echo "==> WELCOME! Now we will customize Debian-based Terminal"
echo "==> Created by Phunt_Vieg_"

cd ~

echo "==> Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "==> Download some terminal tool"
sudo apt install -y build-essential
pkgs=(
    # System monitoring and fun terminal visuals
    btop cmatrix cbonsai cowsay

    # Essential utilities
    make curl wget unzip jq fuse3 dpkg ripgrep fd-find
    fzf eza zoxide tmux stow
    docker-compose

    # CTF tools
    exiftool gdb ascii ltrace strace checksec patchelf upx-ucl binwalk

    # Programming languages
    python3 python3-pip nodejs npm ruby ruby-dev golang

    # Shell & customization
    zsh
)
sudo apt install -y "${pkgs[@]}"

# Install fastfetch
sudo wget https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb -O fastfetch.deb
sudo dpkg -i fastfetch.deb
rm -rf ~/fastfetch.deb

# Install fzf
git clone --depth=1 https://github.com/junegunn/fzf.git
cd fzf
./install --bin
sudo mv ~/fzf/bin/fzf /usr/local/bin
cd ~
rm -rf fzf

# Install bat
sudo wget $(curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | jq -r '.assets[] | select(.name | test("bat_.*amd64.deb")) | .browser_download_url') -O bat.deb
sudo dpkg -i bat.deb
rm -rf bat.deb

# Install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim

# Install lazydocker
go install github.com/jesseduffield/lazydocker@latest
sudo install -Dm755 $HOME/go/bin/lazydocker /usr/local/bin/lazydocker

# Install lazygit
go install github.com/jesseduffield/lazygit@latest
sudo install -Dm755 $HOME/go/bin/lazygit /usr/local/bin/lazygit

# Install pipes.sh
git clone --depth=1 https://github.com/pipeseroni/pipes.sh.git
cd pipes.sh
sudo make install
cd ..
rm -rf pipes.sh
cd ~

# Install pokemon-colorscripts
git clone --depth=1 https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh
cd ..
rm -rf ~/pokemon-colorscripts

# Install oh-my-posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

# Install pwninit
sudo wget https://github.com/io12/pwninit/releases/latest/download/pwninit -O /usr/bin/pwninit
sudo chmod +x /usr/bin/pwninit

echo "==> Allow pip3 install by removing EXTERNALLY-MANAGED file"
sudo rm -rf $(python3 -c "import sys; print(f'/usr/lib/python{sys.version_info.major}.{sys.version_info.minor}/EXTERNALLY-MANAGED')")

echo "==> Download pwndbg and pwntools"
git clone --depth=1 https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ..
pip3 install pwntools
sudo gem install one_gadget

# echo "==> Set up Docker"
sudo systemctl enable --now docker.service
sudo usermod -aG docker $USER

echo "==> Download file config"
git clone --depth=1 https://github.com/ViegPhunt/Dotfiles.git ~/dotfiles
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm

echo "==> Stow"
cd ~/dotfiles
./.config/viegphunt/backup_config.sh
stow -t ~ .
cd ~

echo "==> Change shell"
ZSH_PATH="$(which zsh)"
grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells
chsh -s "$ZSH_PATH"


echo
echo "==> Done!!! Please relogin to apply new config."
echo
