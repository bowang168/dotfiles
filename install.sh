#!/usr/bin/env bash
# install.sh — symlink dotfiles to home directory
# Usage: cd ~/g/dotfiles && ./install.sh
# Safe to run multiple times — existing symlinks are overwritten,
# existing regular files are backed up to ~/.dotfiles_backup/

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
OS_TYPE="$(uname)"

# --- Helpers ---

link() {
    local src="$1" dst="$2"

    # If destination is already a correct symlink, skip
    if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
        echo "  ok  $dst"
        return
    fi

    # Back up existing file (not symlink) before overwriting
    if [[ -e "$dst" && ! -L "$dst" ]]; then
        mkdir -p "$BACKUP_DIR"
        mv "$dst" "$BACKUP_DIR/"
        echo "  bak $dst → $BACKUP_DIR/$(basename "$dst")"
    fi

    mkdir -p "$(dirname "$dst")"
    ln -sf "$src" "$dst"
    echo "  ln  $dst → $src"
}

# --- Shell config ---
echo "Shell config:"
link "$DOTFILES_DIR/.bash_profile"  "$HOME/.bash_profile"
link "$DOTFILES_DIR/.bashrc"        "$HOME/.bashrc"
link "$DOTFILES_DIR/.shell_common"  "$HOME/.shell_common"
link "$DOTFILES_DIR/.zprofile"      "$HOME/.zprofile"
link "$DOTFILES_DIR/.zshenv"        "$HOME/.zshenv"
link "$DOTFILES_DIR/.zshrc"         "$HOME/.zshrc"

# --- Scripts ---
echo "Scripts:"
link "$DOTFILES_DIR/bin/theme"      "$HOME/.local/bin/theme"
link "$DOTFILES_DIR/bin/toggle_app" "$HOME/.local/bin/toggle_app"

# --- Catppuccin zsh colors ---
echo "Zsh themes:"
link "$DOTFILES_DIR/zsh/catppuccin/mocha.zsh" "$HOME/.zsh/catppuccin/mocha.zsh"
link "$DOTFILES_DIR/zsh/catppuccin/latte.zsh" "$HOME/.zsh/catppuccin/latte.zsh"

# --- Neovim ---
echo "Neovim:"
link "$DOTFILES_DIR/nvim/init.lua"       "$HOME/.config/nvim/init.lua"
link "$DOTFILES_DIR/nvim/lazy-lock.json" "$HOME/.config/nvim/lazy-lock.json"

# --- Theme mode (don't overwrite existing preference) ---
if [[ ! -f "$HOME/.theme_mode" ]]; then
    echo "dark" > "$HOME/.theme_mode"
    echo "  new ~/.theme_mode (dark)"
fi

# --- Secrets template (copy, never symlink) ---
if [[ ! -f "$HOME/.bashrc_private" ]]; then
    cp "$DOTFILES_DIR/.bashrc_private.example" "$HOME/.bashrc_private"
    chmod 600 "$HOME/.bashrc_private"
    echo "  new ~/.bashrc_private (from template — edit with real values)"
fi

# --- GNOME Terminal profiles (Linux only) ---
if [[ "$OS_TYPE" != "Darwin" ]] && command -v dconf &>/dev/null; then
    echo "GNOME Terminal:"
    dconf load /org/gnome/terminal/legacy/profiles:/ < "$DOTFILES_DIR/docs/gnome-terminal-profiles.dconf"
    echo "  ok  loaded terminal profiles"
fi

# --- Summary ---
echo ""
echo "Done."
if [[ -d "$BACKUP_DIR" ]]; then
    echo "Backups saved to: $BACKUP_DIR"
fi
echo ""
echo "Next steps:"
echo "  1. Install dependencies (see README.md)"
echo "  2. Edit ~/.bashrc_private with your API keys"
echo "  3. Open a new terminal or run: exec zsh"
