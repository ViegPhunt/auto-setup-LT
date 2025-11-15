#!/usr/bin/env bash
set -euo pipefail


# Variables
#----------------------------
# Color variables
GREEN="\e[32m"
WHITE="\e[0m"
YELLOW="\e[33m"
BLUE="\e[34m"
#----------------------------


# Welcome message
echo -e "
                    ${GREEN}\e[1mWELCOME!${GREEN} 
    Now we will customize Debian-based Terminal
             Created by \e[1;4mPhunt_Vieg_
${WHITE}"

cd ~



# Updating system packages
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[1/7]${GREEN} ==> Updating system packages\n---------------------------------------------------------------------\n${WHITE}"
sudo apt update && sudo apt upgrade -y


# Download some terminal tool
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[2/7]${GREEN} ==> Download some terminal tool\n---------------------------------------------------------------------\n${WHITE}"
sudo apt install -y build-essential
pkgs=(
    # System monitoring and fun terminal visuals
    btop cmatrix cbonsai cowsay

    # Essential utilities
    make curl wget unzip jq fuse3 dpkg ripgrep fd-find
    fzf eza zoxide tmux stow

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


# Allow pip3 install by removing EXTERNALLY-MANAGED file
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[3/7]${GREEN} ==> Allow pip3 install by removing EXTERNALLY-MANAGED file\n---------------------------------------------------------------------\n${WHITE}"
sudo rm -rf $(python3 -c "import sys; print(f'/usr/lib/python{sys.version_info.major}.{sys.version_info.minor}/EXTERNALLY-MANAGED')")


# Download pwndbg and pwntools
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[4/7]${GREEN} ==> Download pwndbg and pwntools\n---------------------------------------------------------------------\n${WHITE}"
git clone --depth=1 https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ..
pip3 install pwntools
sudo gem install one_gadget


# Download file config
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[5/7]${GREEN} ==> Download file config\n---------------------------------------------------------------------\n${WHITE}"
git clone --depth=1 https://github.com/ViegPhunt/Dotfiles.git ~/dotfiles
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm


# Stow
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[6/7]${GREEN} ==> Stow\n---------------------------------------------------------------------\n${WHITE}"
cd ~/dotfiles
./.config/viegphunt/backup_config.sh
stow -t ~ .
cd ~


# Change terminam
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[7/7]${GREEN} ==> Change shell\n---------------------------------------------------------------------\n${WHITE}"
ZSH_PATH="$(which zsh)"
grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells
chsh -s "$ZSH_PATH"


echo -e "\n ${GREEN}
 **************************************************
 *                    \e[1;4mDone\e[0m${GREEN}!!!                     *
 *       Please relogin to apply new config.      *
 **************************************************
 
"

