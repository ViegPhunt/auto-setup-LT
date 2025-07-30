#!/usr/bin/env bash
set -euo pipefail

echo "==> WELCOME! Now we will customize Fedora-based Terminal"
echo "==> Created by Phunt_Vieg_"

cd ~

echo "==> Updating system packages..."
sudo dnf update -y

echo "==> Download some terminal tool"
sudo dnf groupinstall -y "Development Tools"
# Enable eza pkg
sudo dnf copr enable alternateved/eza
pkgs=(
    # System monitoring and fun terminal visuals
    btop cmatrix cowsay fastfetch

    # Essential utilities
    make curl wget unzip dpkg fzf eza bat zoxide neovim tmux ripgrep fd stow man openssh netcat

    # CTF tools
    perl-Image-ExifTool gdb ascii ltrace strace checksec patchelf upx binwalk

    # Programming languages
    python3 python3-pip nodejs npm ruby

    # Shell & customization
    zsh
)
sudo dnf install -y "${pkgs[@]}"

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
echo "==> Done!!! Please restart terminal."
echo
