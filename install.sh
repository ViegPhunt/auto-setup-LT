#!/usr/bin/env bash
set -euo pipefail


echo "==> Download Nix"
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon


CURRENT_SHELL=$(basename "$SHELL")
case "$CURRENT_SHELL" in
    bash) SHELL_RC="$HOME/.bashrc" ;;
    zsh) SHELL_RC="$HOME/.zshrc" ;;
    fish) SHELL_RC="$HOME/.config/fish/config.fish" ;;
    *) SHELL_RC="$HOME/.profile" ;;
esac

LINE='bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/setup.sh)"'
if ! grep -Fxq "$LINE" "$SHELL_RC"; then
    echo -e "\n$LINE" | tee -a "$SHELL_RC"
fi


echo "==> Please restart terminal."