#!/usr/bin/env bash
set -euo pipefail

echo "==> WELCOME! Now we will customize Terminal"
echo "==> Created by Phunt_Vieg_"
cd ~


echo "==> Setting locale"
echo "WARNING: This will change your system locale to en_US.UTF-8"
sleep 2
sudo sed -i '/^#en_US.UTF-8 UTF-8/s/^#//' /etc/locale.gen
sudo locale-gen
sudo localectl set-locale LANG=en_US.UTF-8


echo "==> Setup Nix"
nixConfFile="/etc/nix/nix.conf"
if [ ! -f "$nixConfFile" ]; then
    sudo touch "$nixConfFile"
fi
if grep -q "^experimental-features" "$nixConfFile"; then
    sudo sed -i 's/^experimental-features.*/experimental-features = nix-command flakes/' "$nixConfFile"
else
    echo "experimental-features = nix-command flakes" | sudo tee -a "$nixConfFile"
fi


echo "==> Download some terminal tool"
pkgs=(
    # System monitoring and fun terminal visuals
    btop cmatrix cbonsai pipes cowsay oh-my-posh fastfetch

    # Essential utilities
    gnumake gcc curl wget unzip git dpkg fzf eza bat zoxide tmux neovim ripgrep stow yay
    
    # CTF tools
    exiftool binwalk patchelf pwninit pwntools gdb

    # Programming languages
    python3Full python312Packages.pip pipx nodejs_24

    # Shell & customization
    zsh
)
nix profile install ${pkgs[@]/#/nixpkgs#}


echo "==> Download pwndbg and pwntools"
git clone --depth 1 https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ~


echo "==> Download pokemon-colorscripts"
git clone --depth 1 https://gitlab.com/phoneybadger/pokemon-colorscripts.git
cd pokemon-colorscripts
sudo ./install.sh
cd ~
rm -rf ~/pokemon-colorscripts


echo "==> Download file config"
if [ -d ~/dotfiles ]; then
    echo "Backing up existing ~/dotfiles to ~/dotfiles.bak"
    mv ~/dotfiles ~/dotfiles.bak
fi
git clone --depth 1 https://github.com/ViegPhunt/Dotfiles.git ~/dotfiles
git clone --depth 1 https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm


echo "==> Stow"
cd ~/dotfiles
rm -rf .git README.md
stow -t ~ .
cd ~


CURRENT_SHELL=$(basename "$SHELL")
case "$CURRENT_SHELL" in
    bash) SHELL_RC="$HOME/.bashrc" ;;
    zsh) SHELL_RC="$HOME/.zshrc" ;;
    fish) SHELL_RC="$HOME/.config/fish/config.fish" ;;
    *) SHELL_RC="$HOME/.profile" ;;
esac

echo "==> Cleaning up auto-setup line from $SHELL_RC"
LINE='bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/setup.sh)"'
if grep -Fxq "$LINE" "$SHELL_RC"; then
    sed -i "\|$LINE|d" "$SHELL_RC"
fi


echo "==> Change shell"
ZSH_PATH="$(which zsh)"
grep -qxF "$ZSH_PATH" /etc/shells || echo "$ZSH_PATH" | sudo tee -a /etc/shells
chsh -s "$ZSH_PATH"



echo
echo "==> Done!!! Please restart terminal."
echo
