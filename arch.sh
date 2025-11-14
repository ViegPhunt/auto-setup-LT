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
    Now we will customize Arch-based Terminal
             Created by \e[1;4mPhunt_Vieg_
${WHITE}"

cd ~

# Updating the system
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[1/10]${GREEN} ==> Updating system packages\n---------------------------------------------------------------------\n${WHITE}"
sudo pacman -Syu --noconfirm


# Setting locale 
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[2/10]${GREEN} ==> Setting locale \n---------------------------------------------------------------------\n${WHITE}"
sudo sed -i '/^#en_US.UTF-8 UTF-8/s/^#//' /etc/locale.gen
sudo locale-gen
sudo localectl set-locale LANG=en_US.UTF-8


# Download some terminal tool
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[3/10]${GREEN} ==> Download some terminal tool\n---------------------------------------------------------------------\n${WHITE}"
sudo pacman -S --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~
rm -rf ~/yay


pacman_packages=(
    # System monitoring and fun terminal visuals
    btop cmatrix cowsay fastfetch

    # Essential utilities
    make curl wget unzip dpkg ripgrep fd man openssh netcat
    fzf eza bat zoxide neovim tmux stow
    lazydocker lazygit

    # CTF tools
    perl-image-exiftool gdb ascii ltrace strace checksec patchelf upx binwalk

    # Programming languages
    python3 python-pip nodejs npm ruby go

    # Shell & customization
    zsh
)
aur_packages=(
    # System monitoring and fun terminal visuals
    cbonsai pipes.sh pokemon-colorscripts-git oh-my-posh

    # CTF tools
    pwninit
)


# Download pacman packages
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[4/10]${GREEN} ==> Download pacman packages\n---------------------------------------------------------------------\n${WHITE}"
sudo pacman -S --noconfirm "${pacman_packages[@]}"


# Download yay packages
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[5/10]${GREEN} ==> Download yay packages\n---------------------------------------------------------------------\n${WHITE}"
yay -S --noconfirm "${aur_packages[@]}"


# Allow pip3 install by removing EXTERNALLY-MANAGED file
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[6/10]${GREEN} ==> Allow pip3 install by removing EXTERNALLY-MANAGED file\n---------------------------------------------------------------------\n${WHITE}"
sudo rm -rf $(python3 -c "import sys; print(f'/usr/lib/python{sys.version_info.major}.{sys.version_info.minor}/EXTERNALLY-MANAGED')")


# Download pwndbg and pwntools
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[7/10]${GREEN} ==> Download pwndbg and pwntools\n---------------------------------------------------------------------\n${WHITE}"
git clone --depth=1 https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ..
pip3 install pwntools
sudo gem install one_gadget


# Download file config"
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[8/10]${GREEN} ==> Download file config\n---------------------------------------------------------------------\n${WHITE}"
git clone --depth=1 https://github.com/ViegPhunt/Dotfiles.git ~/dotfiles
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm
 

# Stow
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[9/10]${GREEN} ==> Stow\n---------------------------------------------------------------------\n${WHITE}"
cd ~/dotfiles
./.config/viegphunt/backup_config.sh
stow -t ~ .
cd ~


# Change shell
echo -e "${GREEN}\n---------------------------------------------------------------------\n${YELLOW}[10/10]${GREEN} ==> Change shell\n---------------------------------------------------------------------\n${WHITE}"
ZSH_PATH="$(which zsh)"
grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells
chsh -s "$ZSH_PATH"


echo -e "\n ${GREEN}
 **************************************************
 *                    \e[1;4mDone\e[0m${GREEN}!!!                     *
 *       Please relogin to apply new config.      *
 **************************************************
 
"
